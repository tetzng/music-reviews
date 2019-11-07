class TracksController < ApplicationController
  def index
    RSpotify.authenticate(Rails.application.credentials.spotify[:client_id], Rails.application.credentials.spotify[:client_secret])
    @keyword = "Numb"
    @tracks = RSpotify::Track.search(@keyword)
  end
end
