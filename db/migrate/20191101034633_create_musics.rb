# frozen_string_literal: true

class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.timestamps
    end
  end
end
