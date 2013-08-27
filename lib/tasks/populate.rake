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
      poller = create(:poller, :creator => demo_user, :hostname => `hostname`.chomp, :state => :unknown)
      100.times do
        d = create(:device, :hostname => Faker::Internet.domain_word + ".lvh.me")
        d.dependents << create(:device, :hostname => Faker::Internet.domain_word + ".lvh.me")
      end
      100.times do
        s = create(:service)
        s.dependencies << create(:device, :hostname => Faker::Internet.domain_word + ".lvh.me")
        5.times do
          create(:event, :node => s, :state => [:open, :acknowledged, :resolved][rand(2)], :severity => [:ok, :warning, :critical][rand(2)])
        end

        data_source = create(:data_source, :node_id => s.id, :plugin_id => Plugin.all.order("random()").first.id) 
        data_stream = create(:data_stream, :data_source_id => data_source.id, :poller_id => poller.id)
        graph = create(:graph)
        graph.data_sources << data_source
        graph.save
      end
      100.times do
        create(:event, :state => [:open, :acknowledged, :resolved][rand(2)])
      end
      100.times do
        create(:contact)
      end
      100.times do
        create(:notification)
      end
    end
  end

  desc 'repopulate database from scratch'
  task :repopulate => [:truncate, :seed, :populate]
end
