class UsersController < ApplicationController
  before_action :configure_user

  def spotify
    @spotify_user = RSpotify::User.from_omniauth(request.env["omniauth.auth"])
  end

  def show
    load_playlists unless @user.playlists.size == @spotify_account.playlists.size
  end

  private

  def load_playlists
    @spotify_account.playlists.each { |playlist| load_playlist(playlist.id) }
    # faire une boucle qui vérifie que les playlists sont bien toutes içi
  end

  def delete_playlists
  end
end
