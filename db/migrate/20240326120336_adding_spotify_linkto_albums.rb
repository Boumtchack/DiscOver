class AddingSpotifyLinktoAlbums < ActiveRecord::Migration[7.1]
  def change
    add_column :albums, :spotify_link, :string
  end
end
