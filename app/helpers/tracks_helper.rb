# frozen_string_literal: true

module TracksHelper
  def spotify_info(track)
    RSpotify::Track.find(track.spotify_id)
  end

  def album_id(track)
    RSpotify::Track.find(track.spotify_id).album.id
  end

  def album_name(track)
    RSpotify::Track.find(track.spotify_id).album.name
  end

  def album_image(track)
    images = RSpotify::Track.find(track.spotify_id).album.images
    images.blank? ? 'no_image.png' : images[0]['url']
  end

  def album_type(track)
    RSpotify::Track.find(track.spotify_id).album.album_type
  end

  def album_release_date(track)
    RSpotify::Track.find(track.spotify_id).album.release_date
  end

  def artist_id(track)
    RSpotify::Track.find(track.spotify_id).artists[0].id
  end

  def artist_name(track)
    RSpotify::Track.find(track.spotify_id).artists[0].name
  end
end
