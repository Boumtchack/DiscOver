Rails.application.routes.draw do
  get 'playlists/add_to_spotify'
  get 'songs/my_research'
  root to: "pages#home"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/auth/spotify/callback', to: 'users#spotify'
  # Defines the root path route ("/")
  # root "posts#index"

  resources :songs, only: %i[my_research show] do
    resources :playlists, only: :index
  end

  resources :playlists, only: %i[add_to_spotify show create]

  resources :users, only: %i[show] do
    resources :playlists, only: :index
  end
end
