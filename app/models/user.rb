class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :contacts
  has_many :subscription
  after_create :create_initial_contact
 
  model_stamper
  stampable

  def role_symbols
    if admin?
      [:user, :admin]
    else
      [:user]
    end
  end

  def to_s
    email
  end

  private
  def create_initial_contact
    contact = Contact::Email.new(:email => email)
    contact.user_id = id 
    contact.save!
  end

  
end
