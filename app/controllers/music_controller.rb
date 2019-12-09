# frozen_string_literal: true

class MusicController < ApplicationController
  def index
    track_spotify_ids = Review.group(:track_spotify_id).average(:rate).sort_by{ |k, v| v.to_f }.reverse.slice(0..4).to_h.keys
    @ranking = track_spotify_ids.map{ |id| Track.find_by(spotify_id: id) }
  end
end
