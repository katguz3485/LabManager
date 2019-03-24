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

Rails.logger.info "#{User.all.count} users created "

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

Rails.logger.info "#{Category.all.count} categories created "




chemicals_list =
    [
        {chemical_name: "acetic acid",
         formula: 'C7H6O2',
         molecular_weight: 122.12,
         density: 0,
         cas_number: '65-85-0',
         cid: ChemicalServices::PubChemServiceCid.new(cas: "64-19-7").call,
         canonical_smiles: 'C1=CC=C(C=C1)C(=O)O',
         inchi_key: 'WPYMKLBDIGXBTP-PTQBSOBMSA-N',
         formula_picture: Faker::Avatar.image( "50x50"),
         category_id: Faker::Number.between(1, 33),
         picture_url: "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/#{ChemicalServices::PubChemServiceCid.new(cas: "64-19-7").call}/PNG",
        },

        {
            chemical_name: "Butyric acid",
            formula: 'C10H12N2',
            molecular_weight: 160.216,
            density: 0,
            cas_number: '61-54-1',
            cid: ChemicalServices::PubChemServiceCid.new(cas: "61-54-1").call,
            canonical_smiles: 'C1=CC=C2C(=C1)C(=CN2)CCN',
            inchi_key: 'WPYMKLBDIGXBTP-PTQBSOBMSA-N',
            formula_picture: Faker::Avatar.image("50x50"),
            category_id: Faker::Number.between(1, 33),
            picture_url: "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/#{ChemicalServices::PubChemServiceCid.new(cas: "65-85-0").call}/PNG"


        },
        {
            chemical_name: "Acetic anhydride",
            cas_number: '65-85-0',
            cid: ChemicalServices::PubChemServiceCid.new(cas: "65-85-0").call,
            formula: 'Ac2O',
            molecular_weight: 254.226,
            density: 0,
            canonical_smiles: 'O=[Os](=O)(=O)=O',
            inchi_key: 'WPYMKLBDIGXBTP-PTQBSOBMSA-N',
            formula_picture: Faker::Avatar.image("50x50"),
            category_id: Faker::Number.between(1, 33),
            picture_url: "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/#{ChemicalServices::PubChemServiceCid.new(cas: "65-85-0").call}/PNG"


        }
    ]



chemicals_list.each do |chemical|
  Chemical.create!(chemical_name: chemical[:chemical_name], cas_number: chemical[:cas_number], cid: chemical[:cid], formula: chemical[:formula],
                   molecular_weight: chemical[:molecular_weight], density: chemical[:density], canonical_smiles: chemical[:canonical_smiles],
                   inchi_key: chemical[:inchi_key], category_id: chemical[:category_id], picture_url: chemical[:picture_url])
end

Rails.logger.info "#{Chemical.all.count} chemicals created "


Chemical.all.each do |chemical|
  SafetyPrecaution.create!(
      chemical_id: chemical.id,
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

  Item.create!([{
                    item_owner: "Biological Chemistry and Drug Development Group",
                    quantity: 1,
                    amount: 1.5,
                    comment: "It should be store in the fridge",
                    daily_usage: "5-10 mg",
                    chemical_id: chemical.id},

                {item_owner: "Biological Chemistry and Drug Development Group",
                 quantity: 2,
                 amount: 1.5,
                 comment: "RT",
                 daily_usage: "0 mg",
                 chemical_id: chemical.id}]
  )
end

Rails.logger.info "#{SafetyPrecaution.all.count} safety sheets created "

Rails.logger.info "#{Item.all.count} items created"

Rails.logger.info 'Seeds created'


