# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name                  { "name" }
    email                 { "aaaa@gmail.com" }
    password              { "0000aaaa" }
    password_confirmation { "0000aaaa" }
  end
end
