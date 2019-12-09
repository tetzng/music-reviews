# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.includes(:track)
  rescue ActiveRecord::RecordNotFound => e
    redirect_to :root, alert: 'User not found'
  end
end
