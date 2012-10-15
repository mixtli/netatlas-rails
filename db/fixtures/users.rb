require 'declarative_authorization/maintenance'

admin = nil
Authorization::Maintenance::without_access_control do
  User.seed(:email,
    {:admin => true, :email => 'admin@netatlas.com', :password => 'password', :password_confirmation => 'password' }
  )
end
Authorization.current_user = admin

