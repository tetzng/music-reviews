class ChangeReviewsTrackSpotifyId < ActiveRecord::Migration[5.2]
  def change
    change_column :artists, :spotify_id, :string
    change_column :albums, :spotify_id, :string
  end
end
