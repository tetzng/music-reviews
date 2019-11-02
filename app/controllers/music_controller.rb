class MusicController < ApplicationController
  def index
    require 'rspotify'

    RSpotify.authenticate(Rails.application.credentials.spotify[:client_id], Rails.application.credentials.spotify[:client_secret])
    @artists = RSpotify::Artist.search('sakanaction')
    @artist = @artists.first
    @albums = @artist.albums
    @album = @albums.first
    @tracks = @album.tracks
    @track = @tracks.first
  end
end
