# frozen_string_literal: true

class ChangeColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :rate, :float
  end
end
