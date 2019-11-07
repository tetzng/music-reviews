class ArtistsController < ApplicationController
  def index
    RSpotify.authenticate(Rails.application.credentials.spotify[:client_id], Rails.application.credentials.spotify[:client_secret])
    @keyword = "The"
    @artists = RSpotify::Artist.search(@keyword)
  end
end
