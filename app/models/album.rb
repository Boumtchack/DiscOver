class Album < ApplicationRecord
  has_many :songs
  belongs_to :artist

  has_many :members, through: :artists
  has_many :musicians, through: :members
end
