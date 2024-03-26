class UsersController < ApplicationController
  before_action :configure_user

  def show
    load_playlists
  end

  private

  def delete_playlists
  end

  def load_playlists
    spotify_playlists = @spotify_account.playlists
    spotify_playlists.each do |playlist|
      new_playlist = Playlist.new
      new_playlist.user = @user
      new_playlist.name = playlist.name
      new_playlist.spotify_url = playlist.id
      new_playlist.save
    end
  end

  def configure_user
    @user = current_user
    @spotify_account = RSpotify::User.find(current_user.uid)
  end
end
