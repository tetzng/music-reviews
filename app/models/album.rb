class Album < ApplicationRecord
  def to_param
    spotify_id
  end
end
