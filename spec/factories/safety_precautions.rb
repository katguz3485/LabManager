# frozen_string_literal: true

FactoryBot.define do
  factory :safety_precaution do
    sds_file { Faker::LoremPixel.image('50x60', 'false', 'technics') }
    name_from_sds { 'Di-tert-butyl dicarbonate' }
    pictogram { Faker::LoremPixel.image('50x60', 'false', 'technics') }
    storage_temperature_range { Faker::Number.between(2...20) }
    signal_word { 'Danger' }
    h_codes { "H#{Faker::Number.between(302...335)}" }
    h_statements { "#{h_codes} Fatal if inhaled." }
    p_codes { "P#{Faker::Number.between(200...380)}" }
    p_statements do
      "#{p_codes} Keep away from heat, hot surfaces, sparks, open flames and other
       ignition sources. No smoking"
    end
    adr_number { 'n/a' }
    adr_class { 'Flammable solids, self-reactive substances, and solid desensitized explosives' }
    adr_group { 'n/a' }
  end
end
