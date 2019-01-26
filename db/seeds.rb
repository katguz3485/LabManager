require 'faker'

Rails.logger = Logger.new(STDOUT)
Rails.logger.info "Creating seeds"

user = User.new(
    :email => 'admin@admin.com',
    :password => "adminadmin",
    :username => 'admin1234',
    :avatar => Faker::Avatar.image("my-own-slug", "50x50")
)
user.skip_confirmation!
user.save!

category_list =
    ["Acids", "Acyl halides", "Alcohols", "Aldehydes and ketones", "Amines", "Amino acids",
     "Boronic acids", "Carbohydrates", "Carboxylic acids", "Dyes", "Elements", "Esters and amides", "Ethers", "Heterocyclic", "Hydrides",
     "Hydrocarbons", "Hydroxides", "Inorganic salts", "NMR Spectroscopy: solvents and reagents", "Organic anhydrides", "Organic halides", "Organometalic", "Other", "Oxides", "Palladium complexes", "Phenols",
     "Phosphorus compounds", "Silicon compounds", "Solvents",
     "Solvents, dry", "Solvents, special purity", "Sulfur compounds", "Nitriles"]


category_list.each do |name|
  Category.create!(category_name: name, user_id: 1)
end


chemicals_list =
    [
        {chemical_name: "benzoic acid",
         formula: 'C7H6O2',
         molecular_weight: 122.12,
         density: 0,
         cas_number: '65-85-0',
         canonical_smiles: 'C1=CC=C(C=C1)C(=O)O',
         inchi_key: 'WPYMKLBDIGXBTP-PTQBSOBMSA-N',
         formula_picture: Faker::Avatar.image("benzoic_acid", "50x50"),
         category_id: 1
        },

        {
            chemical_name: "tryptamine",
            formula: 'C10H12N2',
            molecular_weight: 160.216,
            density: 0,
            cas_number: '61-54-1',
            canonical_smiles: 'C1=CC=C2C(=C1)C(=CN2)CCN',
            inchi_key: 'WPYMKLBDIGXBTP-PTQBSOBMSA-N',
            formula_picture: Faker::Avatar.image("tryptamine", "50x50"),
            category_id: 2

        },
        {
            chemical_name: "osmium tetroxide",
            formula: 'OsO4',
            molecular_weight: 254.226,
            density: 0,
            cas_number: '65-85-0',
            canonical_smiles: 'O=[Os](=O)(=O)=O',
            inchi_key: 'WPYMKLBDIGXBTP-PTQBSOBMSA-N',
            formula_picture: Faker::Avatar.image("osmium tetroxide", "50x50"),
            category_id: 2
        }
    ]

=begin
Category.all.each do |category|
  category.chemicals.create!(chemical_name: chemicals_list[:chemical_name].sample,
                             formula: category_list[:formula].sa,
  )
end
=end

Chemical.all.each do |chemical|
  3.times do
    chemical.items.create!(
        item_owner: "Biological Chemistry and Drug Development Group",
        amount: 1.5,
        comment: "It should be store in the fridge",
        daily_usage: "5-10 mg"
    )
    chemical.safety_precaution.create!(
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
  end
end

Items.all.each do |item|
  item.locations.create!(
      room: "F2-35",
      shelf: "F11-A",
      number: "1a",
  )

end


Rails.logger.info 'Seeds created'

