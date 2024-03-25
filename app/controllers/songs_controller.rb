class SongsController < ApplicationController
  before_action :configure_user

  def show
  end

  def my_research
    if params[:query].present?
      @songs = RSpotify::Track.search(params[:query])
    end
  end

  private

  def configure_user
    @user = current_user
    @spotify_account = RSpotify::User.find(current_user.uid)
  end
end
