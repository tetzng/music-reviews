class AddColumnToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :spotify_id, :string
  end
end
