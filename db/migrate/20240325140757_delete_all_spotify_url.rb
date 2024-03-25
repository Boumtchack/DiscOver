class DeleteAllSpotifyUrl < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :spotify_url
    remove_column :users, :user_name
  end
end
