class AddFollowersToPlaylists < ActiveRecord::Migration[7.1]
  def change
    add_column :playlists, :followers, :integer
  end
end
