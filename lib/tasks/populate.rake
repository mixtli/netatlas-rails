namespace :db do
  desc 'Populate db with sample data'
  task :populate => :environment do
    require 'populator'
    require 'faker'
    require 'declarative_authorization/maintenance'
    require "#{Rails.root}/spec/factories"
    Authorization.current_user = User.first
    demo_user = FactoryGirl.create(:user, :email => 'demo@netatlas.com')
    test_user = FactoryGirl.create(:user, :email => 'test@netatlas.com')
    10.times { FactoryGirl.create(:user) }
    User.stamper = demo_user  # to auto set creator_id attributes
    Authorization::Maintenance::with_user(demo_user) do
      100.times do
        FactoryGirl.create(:device)
      end
    end
  end
end
