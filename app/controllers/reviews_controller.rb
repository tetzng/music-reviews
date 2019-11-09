class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @track = Track.find(params[:spotify_id])
  end

  def create
    @track = Track.find(params[:spotify_id])
    Review.create(create_params)
    redirect_to controller: :products, action: :index
  end

  private
  def create_params
    params.require(:review).permit(:rate, :review)
  end
end
