# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    room { Faker::Alphanumeric.alpha(10) }
    shelf { Faker::Alphanumeric.alphanumeric(8) }
    number { "#{Faker::Number.positive}#{Faker::Alphanumeric.alpha(10)}" }
  end
end
