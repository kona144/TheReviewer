Rails.application.routes.draw do
get '/index', to:'application#index'
  get '/home', to: 'application#home'
    get '/profile', to: 'application#profile'
    post '/login', to: 'application#login'
     get '/logout', to: 'application#logout'
     post '/create_user', to: 'application#create_user'
     get '/profile', to: 'application#profile'
post '/change_picture', to: 'application#change_picture'
post '/uploadFile',to: 'application#uploadFile'
post '/change_surname',to: 'application#change_surname'
post '/change_name',to: 'application#change_name'
post '/change_password',to: 'application#change_password'
get '/logs',to: 'application#logs'
get '/new_review',to: 'application#new_review'
post '/create_review',to: 'application#create_review'
get '/review',to: 'application#review'
post '/create_comment',to: 'application#create_comment'
get '/my_reviews',to:'application#my_reviews'
post '/change_title',to: 'application#change_title'
post '/change_content',to: 'application#change_content'
post '/remove_review',to: 'application#remove_review'
get '/log',to:'application#log'
post '/profile_pic_upload',to: 'application#profile_pic_upload'
post '/review_pic_upload',to: 'application#review_pic_upload'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root to:'application#home'

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
