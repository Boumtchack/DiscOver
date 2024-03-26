class PlaylistsController < ApplicationController
  before_action :configure_user
  def index
  end

  def show
    @playlist = Playlist.find(params[:id])
    spotify_playlist = RSpotify::Playlist.find(@spotify_account.id, @playlist.spotify_url)
    load_playlist_songs(@playlist, spotify_playlist)
  end

  def create
  end

  def add_to_spotify
  end
end
