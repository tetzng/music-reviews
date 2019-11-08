class ArtistsController < ApplicationController
  def index
    @keyword = params[:keyword]
    @artists = RSpotify::Artist.search(@keyword)
  end

  def show
    @artist = RSpotify::Artist.find(params[:spotify_id])
  end
end
