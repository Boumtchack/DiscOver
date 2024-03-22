class AddAristReferencesToAlbums < ActiveRecord::Migration[7.1]
  def change
    remove_column :albums, :artist_id
    add_reference :albums, :artist, foreign_key: true
  end
end
