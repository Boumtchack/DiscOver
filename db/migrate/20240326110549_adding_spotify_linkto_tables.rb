class AddingSpotifyLinktoTables < ActiveRecord::Migration[7.1]
  def change
    add_column :playlists, :spotify_link, :string
    add_column :songs, :spotify_link, :string
    add_column :artists, :spotify_link, :string
  end
end
