authorization do

  role :admin do 
    has_omnipotence
  end

  role :user, :includes => :guest do
    has_permission_on :devices, :to => :manage
    has_permission_on :services, :to => :manage
  end


  role :guest do
  end


end
privileges do
  privilege :manage do
    includes :create, :read, :update, :delete, :index, :destroy, :show, :new
  end
end
