class Member < ApplicationRecord
  belongs_to :artist
  belongs_to :musician
end
