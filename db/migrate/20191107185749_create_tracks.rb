class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :track_number
      t.integer :duration_ms
      t.string :preview_url

      t.timestamps
    end
  end
end
