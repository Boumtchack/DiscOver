class Genre < ApplicationRecord
  has_many :artists, through: :styles
end
