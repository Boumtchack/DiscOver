class Artist < ApplicationRecord
  has_many :albums
  has_many :songs, through: :albums

  has_many :styles
  has_many :genres, through: :styles

  has_many :members
  has_many :musicians, through: :members

  validates :spotify_url, uniqueness: true
end
