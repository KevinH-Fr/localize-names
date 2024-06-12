Rails.application.routes.draw do
  get 'names/index'
  get 'forebears/index'
  get 'namsor/index'
  get 'forebears', to: 'forebears#index'
  
  get 'scraper/index'
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'scrape', to: 'scraper#index'
  
  # Defines the root path route ("/")
 # root "home#index"

  get 'names/lookup', to: 'names#lookup'
  get 'names/meaning', to: 'names#meaning'

  resources :names, only: :show

  get "about", to: "home#about"


 root 'home#index' # Set the root path to the lookup page
 
end
