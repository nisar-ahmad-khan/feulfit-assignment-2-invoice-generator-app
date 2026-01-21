# require 'sidekiq/web'
# require 'sidekiq'
Rails.application.routes.draw do
  resources :orders
  resources :options
  resources :option_groups
  resources :menu_items
  resources :menu_categories
  get "home/index"
# mount Sidekiq::Web => '/sidekiq'

  
devise_for :users

mount ActionCable.server => "/cable"
  get "/" ,to: "home#index" ,as: :index_home
 

  resources :line_items
  resources :invoices
  resources :products
  resources :clients

  # get "up" => "rails/health#show", as: :rails_health_check
end
