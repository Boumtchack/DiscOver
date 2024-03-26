class PlaylistManager < ApplicationRecord
  belongs_to :playlist, dependent: :destroy
  belongs_to :song, dependent: :destroy
end
