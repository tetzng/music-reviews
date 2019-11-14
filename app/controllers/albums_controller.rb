# frozen_string_literal: true

class AlbumsController < ApplicationController
  def index
    @keyword = params[:keyword]
    if @keyword.blank?
      redirect_to root_path
    else
      @albums = RSpotify::Album.search(@keyword)
    end
  end

  def show
    @album = RSpotify::Album.find(params[:spotify_id])
  end
end
