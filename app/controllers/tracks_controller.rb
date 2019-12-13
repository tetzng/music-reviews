# frozen_string_literal: true

class TracksController < ApplicationController
  before_action :set_track, only: :show

  def index
    @track_name = params[:track_name]
    @limit = 16
    if @track_name.blank?
      redirect_to root_path
    else
      @tracks = RSpotify::Track.search(@track_name, limit: @limit)
    end
  end

  def show
    @track = Track.find_or_initialize_by(spotify_id: params[:spotify_id])
    track_update_attr if @track.new_record? || @track.album_id.blank?
    @reviews = @track.reviews.includes(:user)
    @your_review = @reviews.find_by(user_id: current_user.id) if user_signed_in?
    set_everyones_reviews
    set_average_score
  end

  private

  def set_track
    @spotify_track = RSpotify::Track.find(params[:spotify_id])
  end

  def set_everyones_reviews
    @everyones_reviews = if user_signed_in? && @your_review.present?
                           @reviews.reject { |review| review == @your_review }
                         else
                           @reviews
                         end
  end

  def set_average_score
    @average_score = if @reviews.find { |arr| !arr.rate.nil? }.present?
                       @reviews.average(:rate).round(1)
                     else
                       '-'
                     end
  end

  def track_update_attr
    @track.update_attributes!(name: @spotify_track.name,
                              track_number: @spotify_track.track_number,
                              duration_ms: @spotify_track.duration_ms,
                              preview_url: @spotify_track.preview_url,
                              album_id: @spotify_track.album.id,
                              album_name: @spotify_track.album.name,
                              album_image: @spotify_track.album.images[0]['url'],
                              album_type: @spotify_track.album.album_type,
                              album_release_date: @spotify_track.album.release_date,
                              artist_id: @spotify_track.artists[0].id,
                              artist_name: @spotify_track.artists[0].name)
  end
end
