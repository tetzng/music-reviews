class ArtistsController < ApplicationController
  def index
    @keyword = "DIR EN GREY"
    @artists = RSpotify::Artist.search(@keyword)
  end

  def show
    @artist = RSpotify::Artist.find(params[:spotify_id])
  end
end
