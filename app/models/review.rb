# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :track, foreign_key: 'track_spotify_id', primary_key: 'spotify_id', class_name: 'Track'
  belongs_to :user, optional: true

  validates :rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_blank: true
  validates :rate, presence: true, unless: %i[review? user_id?]
  validates :user_id, uniqueness: { scope: :track_spotify_id }, if: :user_id
end
