class AddColumnToTracks2 < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :album_id, :string
    add_column :tracks, :album_name, :string
    add_column :tracks, :album_image, :string
    add_column :tracks, :album_type, :string
    add_column :tracks, :album_release_date, :string
    add_column :tracks, :artist_id, :string
    add_column :tracks, :artist_name, :string
  end
end
