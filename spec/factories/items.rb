# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    item_owner { 'Biological Chemistry and Drug Design Group'}
    quantity { Faker::Number.positive(1..10) }
    amount { Faker::Number.positive(1.0..100.0)}
    comment { Faker::Shakespeare.hamlet_quote}
    daily_usage { Faker::Number.positive(0.1..2.5)}
    association :chemical, factory :chemical
  end




end
