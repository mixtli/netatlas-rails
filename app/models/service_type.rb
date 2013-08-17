class ServiceType < ActiveRecord::Base
  belongs_to :default_template
  attr_accessible :default_port, :description, :name
end
