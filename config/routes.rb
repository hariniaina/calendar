Rails.application.routes.draw do
  root "home#index"
  get '/thp', 		to: 'home#thp'
  get '/simplon', 	to: 'home#simplon'
  get '/team', 	to: 'home#team'
  resources :appointments, only: [:index, :new, :edit, :create, :update, :destroy]
  post "/appointments/:id/sender", to: "appointments#sender"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
