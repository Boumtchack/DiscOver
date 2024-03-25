class PlaylistsController < ApplicationController
  before_action :configure_user
  def index
  end

  def show
    @playlist = Playlist.find(params[:id])
  end

  def create
  end

  def add_to_spotify
  end

  private

  def configure_user
    @user = current_user
    @spotify_account = RSpotify::User.find(current_user.uid)
  end
end
