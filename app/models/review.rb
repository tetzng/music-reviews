class Review < ApplicationRecord
  belongs_to :track
  belongs_to :user, optional: true
end
