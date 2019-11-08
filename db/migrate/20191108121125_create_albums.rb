class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :spotify_id
      t.string :album_type
      t.string :release_date

      t.timestamps
    end
  end
end
