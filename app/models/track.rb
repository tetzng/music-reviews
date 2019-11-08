class Track < ApplicationRecord
  has_many :reviews

  def to_param
    spotify_id
  end
end
