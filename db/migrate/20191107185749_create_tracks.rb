# frozen_string_literal: true

class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks, primary_key: :spotify_id, options: 'DEFAULT CHARSET=utf8' do |t|
      t.string :name
      t.integer :track_number
      t.integer :duration_ms
      t.string :preview_url

      t.timestamps
    end
  end
end
