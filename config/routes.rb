require 'sidekiq/web'
require_relative '../app/api/api'
NetatlasRails::Application.routes.draw do
  devise_for :users
  mount Sidekiq::Web, at: '/sidekiq'
  mount NetAtlasAPI => '/api' 
  resources :devices do
    collection do
      get "datatable"
    end
  end
  resources :nodes do
    collection do
      get "datatable"
    end
  end
  resources :graph_items
  resources :groups do
    collection do
      get 'datatable'
      post 'add_node'
      delete 'remove_node'
    end
  end
  resources :graph_templates do
    collection do
      get 'datatable'
    end
  end
  resources :graph_template_items
  resources :pollers
  resources :outages do
    collection do
      get 'datatable'
    end
  end
  resources :data_sources do
    collection do
      get 'datatable'
    end
  end
  resources :data_templates do
    collection do
      get 'datatable'
    end
  end
  resources :interfaces do
    collection do
      get "datatable"
    end
  end
  resources :events do
    collection do
      get "datatable"
    end
  end
  resources :event_filters
  resources :notifications
  resources :contacts
  resources :services do
    collection do
      get 'datatable'
    end
  end
  resources :graphs do
    collection do
      get "datatable"
    end
    member do
      get "data"
    end
  end
  get 'map' => "map#index"
  get 'dashboard' => "dashboard#index"

  mount JasmineRails::Engine => "/specs" unless Rails.env.production?
  get "main/index"
  root :to => "dashboard#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
