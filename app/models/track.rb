# frozen_string_literal: true

class Track < ApplicationRecord
  has_many :reviews, foreign_key: 'track_spotify_id', primary_key: 'spotify_id', class_name: 'Review'
  validates :spotify_id, presence: true
  validates :name, presence: true
  validates :track_number, presence: true
  validates :duration_ms, presence: true

  def to_param
    spotify_id
  end
end
