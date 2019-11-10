class MusicController < ApplicationController
  def index
    @tracks = Track.all
  end
end
