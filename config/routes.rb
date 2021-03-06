Rails.application.routes.draw do

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # 前台
  root 'front#index'
  match '/about', :to => 'front#about', :via => 'get'
  match '/spaces', :to => 'front#spaces', :via => 'get'
  match '/downloads', :to => 'front#downloads', :via => 'get'
  match '/courses', :to => 'front#courses', :via => 'get'
  match '/activities', :to => 'front#activities', :via => 'get'
  match '/contact', :to => 'front#contact', :via => 'get'
  resources :news, :only => [:index, :show]




  # 後台
  resources :admin, :only => [:index]

  namespace :admin do

    # 首頁 Slider 管理
    resources :index_sliders, :only => [:edit, :destroy, :create, :update]
    match 'index_sliders/new_image', :to => 'index_sliders#image', :via => 'get'
    match 'index_sliders/new_link', :to => 'index_sliders#link', :via => 'get'

    # 首頁新聞管理
    resources :news, :only => [:new, :edit, :destroy, :create, :update]

    # 首頁小 Banner 管理
    resources :banners#, :only => [:new, :create, :edit, :update]

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
