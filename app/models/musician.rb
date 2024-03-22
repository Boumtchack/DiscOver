class Musician < ApplicationRecord
  has_many :members
  has_many :artists, through: :members
end
