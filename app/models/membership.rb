class Membership < ActiveRecord::Base
  belongs_to :group
  belongs_to :node
  # attr_accessible :title, :body
end
