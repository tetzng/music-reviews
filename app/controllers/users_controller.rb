# frozen_string_literal: true

class UsersController < ApplicationController
  PER = 5
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.includes(:track).page(params[:page]).per(PER)
  rescue ActiveRecord::RecordNotFound
    redirect_to :root, alert: 'User not found'
  end
end
