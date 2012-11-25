class Contact < ActiveRecord::Base
  belongs_to :user
  attr_accessible :email, :password, :type, :url, :username
  validates :status, :inclusion => ["active", "inactive"]
  class << self
    def types
      [:email, :postback]
    end
  end

  def send_notification(event)
    raise RuntimeError, "send_notification must be implemented in subclasses"
  end

  def active?
    status == "active"
  end

  def to_s
    email
  end
end
