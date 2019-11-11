class Track < ApplicationRecord
  has_many :reviews, foreign_key: "track_spotify_id", primary_key: "spotify_id", class_name: 'Review'

  def to_param
    spotify_id
  end
end
