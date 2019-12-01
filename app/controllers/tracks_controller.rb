# frozen_string_literal: true

class TracksController < ApplicationController
  before_action :set_track, only: :show

  def index
    @keyword = params[:keyword]
    if @keyword.blank?
      redirect_to root_path
    else
      @tracks = RSpotify::Track.search(@keyword)
    end
  end

  def show
    @track = Track.find_or_initialize_by(spotify_id: params[:spotify_id])
    track_update_attr if @track.new_record?
    @album = @spotify_track.album
    @artist = @spotify_track.artists[0]
    @reviews = @track.reviews
    @your_review = @reviews.find_by(user_id: current_user.id) if user_signed_in?
    @everyones_reviews = if user_signed_in?
                           @reviews.where.not(user_id: current_user.id)
                         else
                           @reviews
                         end
    @average_score = if @reviews.find { |arr| !arr.rate.nil? }.present?
                       @reviews.average(:rate).round(1)
                     else
                       '-'
                     end
  end

  private

  def set_track
    @spotify_track = RSpotify::Track.find(params[:spotify_id])
  end

  def track_update_attr
    @track.update_attributes!(name: @spotify_track.name,
                              track_number: @spotify_track.track_number,
                              duration_ms: @spotify_track.duration_ms,
                              preview_url: @spotify_track.preview_url)
  end
end
