class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums, primary_key: :spotify_id do |t|
      t.string :name
      t.string :album_type
      t.string :release_date

      t.timestamps
    end
  end
end
