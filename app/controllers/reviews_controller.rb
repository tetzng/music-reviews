class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @track = Track.find(params[:spotify_id])
  end

  def create
    @track = Track.find_by(spotify_id: params[:spotify_id])
    Review.create(create_params)
    redirect_to track_path(params[:track_spotify_id])
  end

  private
  def create_params
    params.permit(:rate, :review).merge(track_id: params[:track_spotify_id], user_id: current_user.id)
  end
end
