class AlbumsController < ApplicationController
  def index
    @keyword = params[:keyword]
    @albums = RSpotify::Album.search(@keyword)
  end
  def show
    @album = RSpotify::Album.find(params[:spotify_id])
  end
end
