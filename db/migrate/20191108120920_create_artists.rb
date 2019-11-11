class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists, primary_key: :spotify_id do |t|
      t.string :name

      t.timestamps
    end
  end
end
