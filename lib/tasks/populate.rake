namespace :db do
  desc 'Populate db with sample data'
  task :populate => :environment do
    require 'populator'
    require 'faker'
    require 'declarative_authorization/maintenance'
    require "#{Rails.root}/spec/factories"
    include FactoryGirl::Syntax::Methods
    Authorization.current_user = User.first
    demo_user = create(:user, :email => 'demo@netatlas.com') 
    test_user = create(:user, :email => 'test@netatlas.com')
    10.times { create(:user) }
    User.stamper = demo_user  # to auto set creator_id attributes
    Authorization::Maintenance::with_user(demo_user) do
      create(:poller, :creator => demo_user, :hostname => `hostname`.chomp, :state => :unknown)
      100.times do
        create(:device)
      end
      100.times do
        create(:service)
      end
      100.times do
        create(:event)
      end
    end
  end

  task :repopulate => [:truncate, :seed_fu, :populate]
end
