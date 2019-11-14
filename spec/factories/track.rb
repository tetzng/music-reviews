# frozen_string_literal: true

FactoryBot.define do
  factory :track do
    spotify_id { Faker::Internet.password }
    name { Faker::Music::GratefulDead.song }
    track_number { Faker::Number.within(range: 1..15) }
    duration_ms { Faker::Number.number(digits: 6) }
    preview_url { Faker::Internet.url }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
