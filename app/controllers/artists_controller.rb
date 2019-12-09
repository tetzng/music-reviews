# frozen_string_literal: true

class ArtistsController < ApplicationController
  def index
    @artist_name = params[:artist_name]
    if @artist_name.blank?
      redirect_to root_path
    else
      @artists = RSpotify::Artist.search(@artist_name)
    end
  end

  def show
    @artist = RSpotify::Artist.find(params[:spotify_id])
    # recommendations = RSpotify::Recommendations.generate(seed_artists: [@artist.id])
    # @tracks = recommendations.tracks
  end
end
