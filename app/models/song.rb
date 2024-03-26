class Song < ApplicationRecord
  belongs_to :album
  has_one :artist, through: :album

  has_many :playlist_managers
  has_many :playlists, through: :playlist_managers

  validates :spotify_url, uniqueness: true
  validates :spotify_link, uniqueness: true
end
