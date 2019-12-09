# frozen_string_literal: true

class MusicController < ApplicationController
  def index
    track_spotify_ids = Review.group(:track_spotify_id, :rate).order('average_rate DESC').limit(5).average(:rate).keys
    @ranking = track_spotify_ids.map{ |id| Track.find_by(spotify_id: id) }
    review_ids = Review.select(:id).order('id DESC').limit(5)
    @new_reviews = review_ids.map{ |id| Review.find_by(id: id) }
  end
end
