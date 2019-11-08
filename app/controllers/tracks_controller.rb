class TracksController < ApplicationController
  def index
    @keyword = "Numb"
    @tracks = RSpotify::Track.search(@keyword)
  end

  def show
    track = RSpotify::Track.find(params[:spotify_id])
    @track = Track.find_or_initialize_by(spotify_id: params[:spotify_id])
    if @track.new_record?
      @track.update_attributes!(name: track.name,
                                track_number: track.track_number,
                                duration_ms: track.duration_ms,
                                preview_url: track.preview_url
                              )
    end
    @album = track.album
    @artist = track.artists[0]
  end
end
