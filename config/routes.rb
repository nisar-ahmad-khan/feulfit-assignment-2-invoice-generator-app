# require 'sidekiq/web'
# require 'sidekiq'
Rails.application.routes.draw do
# mount Sidekiq::Web => '/sidekiq'

  
devise_for :users



  get "/" ,to: "clients#index"
 

  resources :line_items
  resources :invoices
  resources :products
  resources :clients

  # get "up" => "rails/health#show", as: :rails_health_check
end
