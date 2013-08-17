privileges do
  privilege :manage do
    includes :create, :read, :update, :delete, :index, :destroy, :show, :new
  end
end

authorization do

  role :admin do 
    has_omnipotence
  end

  role :guest do
  end

  role :user, :includes => :guest do
    has_permission_on :devices, :to => :manage
    has_permission_on :services, :to => :manage
    has_permission_on :pollers, :to => :manage
  end

end
