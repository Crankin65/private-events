Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "events#index"
  get "/events/create", to: 'events#create'
  resources :events
  resources :users, only: [:show]
  get 'users/:id/show', to: "users#show", as: :attended_events

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  put 'events/:id/attend', to: 'events#attend', as: 'attend'
end
