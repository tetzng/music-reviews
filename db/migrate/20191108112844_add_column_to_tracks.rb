# frozen_string_literal: true

class AddColumnToTracks < ActiveRecord::Migration[5.2]
  def change
    change_column :tracks, :spotify_id, :string
    add_index :tracks, :spotify_id
  end
end
