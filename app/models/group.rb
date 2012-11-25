class Group < ActiveRecord::Base
  belongs_to :parent
  has_many :memberships
  has_many :nodes, :through => :memberships
  attr_accessible :name
end
