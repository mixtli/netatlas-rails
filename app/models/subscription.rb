class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :event_filter
  validates :user_id, :event_filter_id, :presence => true
end
