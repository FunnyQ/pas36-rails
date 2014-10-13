Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # 前台
  root 'front#index'

  resources :news, :only => [:index, :show]

  get '/about', :to => 'front#about'
  get '/spaces', :to => 'front#spaces'
  get '/downloads', :to => 'front#downloads'
  get '/courses', :to => 'front#courses'
  get '/activities', :to => 'front#activities'



  # 後台
  resources :admin, :only => [:index]

  namespace :admin do

    # 首頁 Slider 管理
    resources :index_sliders, :only => [:edit, :destroy, :create, :update]
    get '/index_sliders/new_image', :to => 'index_sliders#image'
    get '/index_sliders/new_link', :to => 'index_sliders#link'

    # 首頁新聞管理
    resources :news, :only => [:new, :edit, :destroy, :create, :update]

    # 關於我們管理
    resources :abouts#, :only => [:edit, :index, :update]
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
