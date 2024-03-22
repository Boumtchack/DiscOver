class Song < ApplicationRecord
  belongs_to :album
  has_one :artist, through: :album

  has_many :playlists, through: :playlist_managers
end
