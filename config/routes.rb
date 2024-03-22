Rails.application.routes.draw do
  get 'playlists/add_to_spotify'
  get 'songs/my_research'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :songs, only: %i[my_research show] do
    resources :playlists, only: :index
  end

  resources :playlists, only: %i[add_to_spotify show new create]

  resources :users, only: %i[show] do
    resources :playlists, only: :index
  end
end
