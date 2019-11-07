class AlbumsController < ApplicationController
  def index
    RSpotify.authenticate(Rails.application.credentials.spotify[:client_id], Rails.application.credentials.spotify[:client_secret])
    @keyword = "Rubber"
    @albums = RSpotify::Album.search(@keyword)
  end
end
