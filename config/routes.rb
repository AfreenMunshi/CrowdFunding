CF::Application.routes.draw do

  # ASK...
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope "(:locale)", :locale => /en|ba|hi/ do
    #here only two languages are accepted: english and french
    root 'campaigns#index'

    resources :categories

    resources :transactions

    resources :campaigns

    devise_for :users

    # get '/', to: 'campaigns#index', as: :lang_root


    get '/donate/:campaign_id', to: 'transactions#new', as: :donate
    get '/users/:id', to: 'users#show', as: :dashboard
    post '/verify/:tran_id', to: 'transactions#verify', as: :verify_transaction
    post '/regenerate_otp/:tran_id', to: 'transactions#generate_otp_code', as: :otp_regenerate
    get '/:category_id/campaigns', to: 'campaigns#index', as: :category_campaign
    get '/users/:action(/:id)', :controller => 'users'
    get 'tags/:tag', to: 'campaigns#index', as: :tag
    post '/store_bank_account', to: 'balanced#store_bank_account', as: :store_bank_account
    post '/store_credit_card', to: 'balanced#store_credit_card', as: :store_credit_card
    get '/new_card', to: 'users#new_card'
    get '/credit_card_form', to: 'transactions#credit_card_form'
    get '/statistics', to: 'categories#index', as: :statistics

    get '/about_us', to: 'users#about', as: :about_us
    get '/contact_us', to: 'users#contact', as: :contact_us
# get '/languages/:locale', to: 'categories#index', as: :languages
end

  post '/vote_for_campaign/:id', to: 'campaigns#vote_for_campaign', as: :campaign_vote

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
