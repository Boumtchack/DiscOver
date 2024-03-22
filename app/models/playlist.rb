class Playlist < ApplicationRecord
  belongs_to :user

  has_many :songs, through: :playlist_managers
end
