# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8)
    name                  { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { password }
    password_confirmation { password }
    avatar {File.open("#{Rails.root}/public/images/test_image.png")}
  end
end
