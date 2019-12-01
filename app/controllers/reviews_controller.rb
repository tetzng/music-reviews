# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update destroy]

  def create
    @review = Review.create(create_params)
    redirect_to track_path(params[:track_spotify_id])
  end

  def edit
    @track = Track.find_by(spotify_id: params[:track_spotify_id])
    @spotify_track = RSpotify::Track.find(@track.spotify_id)
    @album = @spotify_track.album
    @artist = @spotify_track.artists[0]
    @reviews = @track.reviews
    @average_score = if @reviews.find { |arr| !arr.rate.nil? }.present?
                       @reviews.average(:rate).round(1)
                     else
                       '-'
                     end
  end

  def update
    if @review.user_id == current_user.id
      @review.update(update_params)
      redirect_to track_path(params[:track_spotify_id])
    else
      render 'edit'
    end
  end

  def destroy
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to track_path(params[:track_spotify_id])
    else
      root_path
    end
  end

  private

  def create_params
    if user_signed_in?
      params.permit(:rate, :review).merge(track_spotify_id: params[:track_spotify_id], user_id: current_user.id)
    else
      params.permit(:rate, :review).merge(track_spotify_id: params[:track_spotify_id])
    end
  end

  def update_params
    params.require(:review).permit(:rate, :review).merge(track_spotify_id: params[:track_spotify_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
