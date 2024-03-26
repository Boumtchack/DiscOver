class Genre < ApplicationRecord
  has_many :artists, through: :styles

  validates :name, uniqueness: true
end
