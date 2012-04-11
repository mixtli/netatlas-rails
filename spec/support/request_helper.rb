module RequestHelper
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
  config.include Capybara::DSL, :type => :request
    config.include RequestHelper, :type => :request
end
