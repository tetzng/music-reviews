# frozen_string_literal: true

class MusicController < ApplicationController
  def index
    @tracks = Track.all
  end
end
