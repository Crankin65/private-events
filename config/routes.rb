Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "events#index"
  get "/events/create", to: 'events#create'
  resources :events
  resources :users, only: :show

end
