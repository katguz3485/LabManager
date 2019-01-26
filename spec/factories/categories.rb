# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    category_name { Faker::Name.name }
    user_id { Faker::Number.positive(1-10)}

  end
end
