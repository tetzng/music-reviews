# frozen_string_literal: true

class Track < ApplicationRecord
  has_many :reviews, foreign_key: 'track_spotify_id', primary_key: 'spotify_id', class_name: 'Review'

  validates :name, presence: true

  def to_param
    spotify_id
  end
end
