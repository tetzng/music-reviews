# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.includes(:track)
  end
end
