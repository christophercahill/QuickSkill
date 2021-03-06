Rails.application.routes.draw do

  devise_for :users, only: [:new, :create]

  resources :users, only: [] do
    resources :profiles
  end

 get '/posts/search' => 'posts#search'


  resources :posts  

  resources :profiles do 
    resources :reviews 
  end 

  resources :topics do 
    resources :posts 
  end 

  devise_for :users, :controllers => {registrations: 'devise/registrations'}

  get '/looking_for', to: 'posts#looking_for'
  get '/offering', to: 'posts#offering'
  get :send_contact_email, to: 'email#send_contact_email', as: :send_contact_email

  get '/about', to: 'welcome#about'
  get '/contact', to: 'welcome#contact'

  root 'welcome#index'

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
