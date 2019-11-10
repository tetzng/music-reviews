class ChangeReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :track_id
    add_column :reviews, :track_spotify_id, :bigint, index: true
    add_foreign_key :reviews, :tracks, column: :track_spotify_id
  end
end
