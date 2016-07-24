Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, only: []

  as :user do 
    post '/api/login' => 'sessions#create'
    delete '/api/logout' => 'sessions#destroy'
    get '/api/token' => 'sessions#check_token'
    get '/api/users' => 'api/users#show'
    put '/api/users' => 'api/users#update'
    post '/api/check_password' => 'api/passwords#check_password'
    put '/api/users/update_password' => 'api/passwords#password_update'
  end

  namespace :api do
    devise_for :users, skip: [:sessions], :controllers => {registrations: 'api/users'}
    resources :questions
    resources :answers
    resources :item_comments, only: [:create, :index]
    resources :reports, only: [:create]
    resources :followers, only: [:create, :destroy]
    post 'question_upvotes/:id' => 'question_upvotes#create'
    delete 'question_upvotes/:id' => 'question_upvotes#destroy'
    get 'user_questions' => 'questions#user_questions'
    get 'report_options' => 'report_options#index'
  end


  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
