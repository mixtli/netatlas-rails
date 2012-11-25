class Notification < ActiveRecord::Base
  belongs_to :event
  belongs_to :contact
  belongs_to :event_filter
  # attr_accessible :title, :body
  default_scope includes(:event, :contact)
  state_machine :state, :initial => :pending do
    state :delivered
    state :failed
    event :deliver do
      transition :pending => :delivered
    end
    event :failit do #fail is taken by object
      transition :pending => :failed
    end
  end
end
