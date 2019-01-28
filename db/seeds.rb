require 'faker'

Rails.logger = Logger.new(STDOUT)
Rails.logger.info "Creating seeds"

5.times do
  user = User.new(
      :email => Faker::Internet.email,
      :password => Faker::Internet.password(10, 20),
      :username => Faker::Internet.username(5..8),
      :avatar => Faker::Avatar.image("my-own-slug", "50x50")
  )
  user.skip_confirmation!
  user.save!
end

category_list =
    ["Acids", "Acyl halides", "Alcohols", "Aldehydes and ketones", "Amines", "Amino acids",
     "Boronic acids", "Carbohydrates", "Carboxylic acids", "Dyes", "Elements", "Esters and amides",
     "Ethers", "Heterocyclic", "Hydrides", "Hydrocarbons", "Hydroxides", "Inorganic salts",
     "NMR Spectroscopy: solvents and reagents", "Organic anhydrides", "Organic halides", "Organometalic",
     "Other", "Oxides", "Palladium complexes", "Phenols",
     "Phosphorus compounds", "Silicon compounds", "Solvents",
     "Solvents, dry", "Solvents, special purity", "Sulfur compounds", "Nitriles"]

category_list.each do |category|
  Category.create!(category_name: category, user_id: Faker::Number.between(1, 5))
end

chemical_names_list = ["Sodium cyanide", "Potassium cyanide", "Butyric acid", "Pentanoic acid", "Methanol", "Ethanol",
                       "Acetic acid", "Acetic anhydride", "Formic acid"]


chemicals_list =
    [
        {chemical_name: "Sodium cyanide",
         formula: 'C7H6O2',
         molecular_weight: 122.12,
         density: 0,
         cas_number: '65-85-0',
         canonical_smiles: 'C1=CC=C(C=C1)C(=O)O',
         inchi_key: 'WPYMKLBDIGXBTP-PTQBSOBMSA-N',
         formula_picture: Faker::Avatar.image("benzoic_acid", "50x50"),
         category_id: Faker::Number.between(1, 33)
        },

        {
            chemical_name: "Butyric acid",
            formula: 'C10H12N2',
            molecular_weight: 160.216,
            density: 0,
            cas_number: '61-54-1',
            canonical_smiles: 'C1=CC=C2C(=C1)C(=CN2)CCN',
            inchi_key: 'WPYMKLBDIGXBTP-PTQBSOBMSA-N',
            formula_picture: Faker::Avatar.image("tryptamine", "50x50"),
            category_id: Faker::Number.between(1, 33)

        },
        {
            chemical_name: "Acetic anhydride",
            formula: 'OsO4',
            molecular_weight: 254.226,
            density: 0,
            cas_number: '65-85-0',
            canonical_smiles: 'O=[Os](=O)(=O)=O',
            inchi_key: 'WPYMKLBDIGXBTP-PTQBSOBMSA-N',
            formula_picture: Faker::Avatar.image("osmium tetroxide", "50x50"),
            category_id: Faker::Number.between(1, 33)
        }
    ]


chemicals_list.each do |chemical|
  Chemical.create!(chemical)
end

items_list = [{item_owner: "Biological Chemistry and Drug Development Group",
               quantity: 10,
               amount: 1.5,
               comment: "It should be store in the fridge",
               daily_usage: "5-10 mg",
               chemical_id: 1},

              {item_owner: "Inorganic Cgemistry",
               quantity: 10,
               amount: 1.5,
               comment: "-",
               daily_usage: "5-10 mg",
               chemical_id: 3},


              {item_owner: "Organic Chemistry",
               quantity: 10,
               amount: 1.5,
               comment: "-",
               daily_usage: "5-10 mg",
               chemical_id: 3

              }]

items_list.each do |item|
  Item.create!(item)
end


SafetyPrecaution.create!(
    chemical_id: 1,
    sds_file: "61-54-1_msds.pdf",
    name_from_sds: "",
    pictogram: "",
    storage_temperature_range: "5-10 st",
    signal_word: "Uwaga",
    h_codes: "H201",
    h_statements: "Explosive; mass explosion hazard",
    p_codes: "P333 + P313",
    p_statements: "If skin irritation or rash occurs: Get medical advice/attention.",
    adr_number: "",
    adr_class: "",
    adr_group: ""
)


Location.create!(
    item_id: 1,
    room: "F2-35",
    shelf: "F11-A",
    number: "1a",
)


Rails.logger.info 'Seeds created'


