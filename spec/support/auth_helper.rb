# as_user taken from 
# http://schneems.com/post/15948562424/speed-up-capybara-tests-with-devise
# Allows faster tests by not hitting the login page every time
module AuthHelper
  #include Capybara::Driver::Sessions
  include Warden::Test::Helpers
  Warden.test_mode!

  def login_user(user)
    visit new_user_session_path #(:subdomain => site ? site.subdomain : nil)
    #fill_in 'Email', :with => user.email
    fill_in t('activerecord.attributes.user.email'), :with => user.email
    #fill_in 'Password', :with => user.password
    fill_in t('activerecord.attributes.user.password'), :with => user.password
    #click_button 'Sign in'
    click_button t('devise.shared.links.sign_in')
    page.should have_content('Signed in successfully')
    user
  end


  def login_as_user(user = nil)
    user ||= create(:user, :email => 'user@netatlas.com')
    authorize 'user@netatlas.com', 'password'
  end

  def as_user(user=nil, &block)
    current_user = user || FactoryGirl.create(:user)
    if request.present?
      sign_in(current_user)
    else
      login_as(current_user, :scope => :user)
    end
    block.call if block.present?
    return self
  end

  def as_visitor(user=nil, &block)
    current_user = user || Factory.stub(:user)
    if request.present?
      sign_out(current_user)
    else
      logout(:user)
    end
    block.call if block.present?
    return self
  end
   
  

  #def visit_subdomain(sub)
  #  case Capybara.current_driver
  #    when :selenium, :akephalos
  #      Capybara.app_host = "http://#{sub}.lvh.me:9887"
  #      visit "http://#{sub}.lvh.me:9887"
  #    when :rack_test
  #      Capybara.app_host = "http://#{sub}.example.com"
  #      visit "http://#{sub}.example.com"
  #    end
  #end
  #def within_site(site)
  #  begin
  #    visit_subdomain(site.subdomain)
  #    yield
  #  ensure
  #    Capybara.app_host = "http://example.com"
  #  end
  #end
end

RSpec.configure do |config|
    config.include AuthHelper, :type => :request
    config.include AuthHelper, :type => :controller
end
