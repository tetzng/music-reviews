# frozen_string_literal: true

class ArtistsController < ApplicationController
  def index
    @keyword = params[:keyword]
    if @keyword.blank?
      redirect_to root_path
    else
      @artists = RSpotify::Artist.search(@keyword)
    end
  end

  def show
    @artist = RSpotify::Artist.find(params[:spotify_id])
    recommendations = RSpotify::Recommendations.generate(seed_artists: [@artist.id])
    @tracks = recommendations.tracks
  end
end
