# frozen_string_literal: true

class Artist < ApplicationRecord
  def to_param
    spotify_id
  end
end
