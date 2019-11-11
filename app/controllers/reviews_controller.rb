class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @track = Track.find(params[:spotify_id])
  end

  def create
    @review = Review.create(create_params)
    redirect_to track_path(params[:track_spotify_id])
  end

  private
  def create_params
    if user_signed_in?
      params.require(:review).permit(:rate, :review).merge(track_spotify_id: params[:track_spotify_id], user_id: current_user.id)
    else
      params.require(:review).permit(:rate, :review).merge(track_spotify_id: params[:track_spotify_id])
    end
  end
end
