# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    rate_ary = 0.step(by: 0.5).take(11)
    rate { rate_ary.sample }
    review { Faker::Lorem.sentence }
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
    track
  end
end
