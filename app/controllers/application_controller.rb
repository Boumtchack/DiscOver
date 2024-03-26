class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def configure_user
    @user = current_user
    @spotify_account = RSpotify::User.find(current_user.uid)
  end


  def load_song(spotify_url)
    return if Song.where(spotify_url: spotify_url).exists?

    track = RSpotify::Track.find(spotify_url)
    album_id = track.album.id
    new_song = Song.new
    new_song.title = track.name
    new_song.length = track.duration_ms
    new_song.spotify_url = track.id
    new_song.spotify_link = track.external_urls["spotify"]
    load_album(album_id)
    new_song.album = Album.where(spotify_url: album_id).first
    new_song.save!
  end

  def load_playlist_songs(new_playlist, playlist)
    playlist.tracks.each do |track|
      load_song(track.id)
      song = Song.where(spotify_url: track.id)
      new_playlist.songs << song
    end
  end

  def load_playlist(spotify_url)
    return if Playlist.where(spotify_url: spotify_url).exists?

    playlist = RSpotify::Playlist.find(@spotify_account.id, spotify_url)
    new_playlist = Playlist.new
    new_playlist.user = @user
    new_playlist.name = playlist.name
    new_playlist.spotify_url = playlist.id
    new_playlist.followers = playlist.followers['total']
    new_playlist.spotify_link = playlist.external_urls["spotify"]
    new_playlist.save!
  end

  def load_album(spotify_url)
    return if Album.where(spotify_url: spotify_url).exists?

    album = RSpotify::Album.find(spotify_url)
    artist_id = album.artists.first.id
    new_album = Album.new
    new_album.title = album.name
    new_album.date_of_release = album.release_date
    new_album.spotify_url = album.id
    new_album.spotify_link = album.external_urls["spotify"]
    load_artist(artist_id)
    new_album.artist = Artist.where(spotify_url: artist_id).first
    new_album.save!
  end

  def load_artist(spotify_url)
    return if Artist.where(spotify_url: spotify_url).exists?

    artist = RSpotify::Artist.find(spotify_url)
    new_artist = Artist.new
    new_artist.name = artist.name
    new_artist.spotify_url = artist.id
    new_artist.spotify_link = artist.external_urls["spotify"]
    new_artist.save!
  end
end
