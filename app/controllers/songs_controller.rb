class SongsController < ApplicationController
  before_action :configure_user

  def show
  end

  def my_research
    @tracks = RSpotify::Track.search(params[:query]) if params[:query].present?
    @songs = []
    @tracks.each do |track|
      load_song(track.id)
      @songs << Song.where(spotify_url: track.id).first
    end
  end
end
