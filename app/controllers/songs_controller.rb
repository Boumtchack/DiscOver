class SongsController < ApplicationController
  before_action :configure_user

  def show
  end

  def my_research
    @tracks = RSpotify::Track.search(params[:query]) if params[:query].present?
    @songs = []
    @artists = []
    @tracks.each do |track|
      song_artist = track.album.artists.first.name
      load_song(track.id)
      @songs << Song.where(spotify_url: track.id).first if verify_artist_uniqueness(song_artist)
    end
  end

  private

  def verify_artist_uniqueness(artist)
    if @artists.include?(artist)
      false
    else
      @artists << artist
    end
  end
end
