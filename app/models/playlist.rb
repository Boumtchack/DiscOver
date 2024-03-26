class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_managers
  has_many :songs, through: :playlist_managers
  validates :spotify_url, uniqueness: true
end
