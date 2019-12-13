# frozen_string_literal: true

class Track < ApplicationRecord
  has_many :reviews, foreign_key: 'track_spotify_id', primary_key: 'spotify_id', class_name: 'Review'
  validates :spotify_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :track_number, presence: true
  validates :duration_ms, presence: true

  def to_param
    spotify_id
  end

  def average_score
    if reviews.find { |arr| !arr.rate.nil? }.present?
      reviews.average(:rate).round(1)
    else
      '-'
    end
  end
end
