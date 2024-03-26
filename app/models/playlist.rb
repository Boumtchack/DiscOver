class Playlist < ApplicationRecord
  belongs_to :user
  has_many :songs, through: :playlist_managers
  validates :spotify_url, uniqueness: true
end
