# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :track, foreign_key: "track_spotify_id", primary_key: "spotify_id", class_name: 'Track'
  belongs_to :user, optional: true
end
