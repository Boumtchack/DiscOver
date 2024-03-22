class CreateAlbums < ActiveRecord::Migration[7.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.date :date_of_release
      t.string :spotify_url
      t.references :artist, foreign_key: true
      t.timestamps
    end
  end
end
