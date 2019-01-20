# frozen_string_literal: true

FactoryBot.define do
  factory :chemical do
    chemical_name {'benzene'}
    formula {'C6H6'}
    molecular_weight {78.11}
    density {0.87}
    cas_number {'71-43-2'}
    canonical_smiles {'C1=CC=CC=C1'}
    inchi_key {'UHOVQNZJYSORNB-UHFFFAOYSA-N'}
    user_id {Faker::Number.positive(1..2)}
    formula_picture {Faker::Avatar.image('picture', '50x50')}
    association :category, factory :category
  end
end
