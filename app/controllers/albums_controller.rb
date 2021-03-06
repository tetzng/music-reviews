# frozen_string_literal: true

class AlbumsController < ApplicationController
  def index
    @album_name = params[:album_name]
    @limit = 16
    @offset = if params[:page].nil?
                0
              else
                (params[:page].to_i - 1) * limit
              end
    # "#{@offset + 1}-#{@offset + @limit}件"
    if @album_name.blank?
      redirect_to root_path
    else
      @albums = RSpotify::Album.search(@album_name, limit: @limit, offset: @offset)
    end
  end

  def show
    @album = RSpotify::Album.find(params[:spotify_id])
    # idがないページの場合
    # rescue RestClient::BadRequest
    #   redirect_to root_path
  end
end
