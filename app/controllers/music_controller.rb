class MusicController < ApplicationController
  def index
    @artists = RSpotify::Artist.search('Oasis')
    @artist = @artists.first
    @albums = @artist.albums
    @album = @albums.first
    @tracks = @album.tracks
    @track = @tracks.first
  end
end
