 Mystuff::Application.routes.draw do
  
  
  get "sellproduct/viewsellproduct" ,:as=>:view_sellproduct
              post "sellproduct/remove_all"=>"sellproduct#remove_all", :as=>:remove_all_stuff

  
  get "stuff/viewall"=>"stuff#viewall", :as=>:view_stuff
   get "stuff/all_category"=>"stuff#all_category", :as=>:all_category
  post "stuff/create"=>"stuff#create", :as=>:create_stuff
  post "stuff/edit"=>"stuff#edit", :as=>:edit_stuff
   post "stuff/update"=>"stuff#update", :as=>:update_stuff
      post "stuff/delete"=>"stuff#delete", :as=>:delete_stuff
            post "stuff/delete_all"=>"stuff#delete_all", :as=>:delete_all_stuff
            post "stuff/add_to_sell"=>"stuff#add_to_sell", :as=>:add_to_sell
              post "stuff/add_category"=>"stuff#add_category", :as=>:add_category
            post "stuff/add_security"=>"stuff#add_security", :as=>:add_security


  get "session/new"=>"session#new" , :as=>:user_login
  post "session/create"=>"session#create", :as=>:create_session
  get "user/index"=>"user#index",:as=>:user_home
  
  
  
  post "/"=>"user#index"
  get "user/logout"=>"user#logout", :as=>:user_logout
  get "user/new"=>"user#new", :as=>:new_user
  post "user/create"=>"user#create", :as=>:create_user
  post "user/check_useremail"=>"user#check_useremail", :as=>:check_useremail
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'application#index'

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
