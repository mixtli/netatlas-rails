namespace :db do
  desc 'Populate db with sample data'
  task :generate_data => :environment do
    require 'populator'
    require 'faker'
    require 'declarative_authorization/maintenance'
    require "#{Rails.root}/spec/factories"
    include FactoryGirl::Syntax::Methods
    Authorization.current_user = User.first
    #Authorization::Maintenance::with_user(demo_user) do
      DataStream.all.each do |data_stream|
        time = Time.now.to_i
        start = (time - 24*60*60)
        total = time - start
        (start.to_i..time.to_i).step(300) do |i|
          t = (time - i).to_f/total
          amplitude = 90 + rand(20)
          phase = 1 / (rand(8) * 3.14)
          freq = rand(4)
          value = Math.sin(phase + (freq * t * 4 * 3.14)) * amplitude
          AddDataService.call(data_stream.id,value, Time.at(i))
        end
      end
    #end
  end

end
