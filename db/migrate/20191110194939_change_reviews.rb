# frozen_string_literal: true

class ChangeReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :track_spotify, type: :string, limit: 32
    add_foreign_key :reviews, :tracks, column: :track_spotify_id, primary_key: :spotify_id
  end
end
