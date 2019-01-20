# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Seeds creation started'

User.create!(email: 'admin@admin.com', password: 'adminadmin')


category_list =
    ["Acids", "Acyl halides", "Alcohols", "Aldehydes and ketones", "Amines", "Amino acids",
     "Boronic acids", "Carbohydrates", "Carboxylic acids", "Dyes", "Elements", "Esters and amides", "Ethers", "Heterocyclic", "Hydrides",
     "Hydrocarbons", "Hydroxides", "Inorganic salts", "NMR Spectroscopy: solvents and reagents", "Organic anhydrides", "Organic halides", "Organometalic", "Other", "Oxides", "Palladium complexes", "Phenols",
     "Phosphorus compounds", "Silicon compounds", "Solvents",
     "Solvents, dry", "Solvents, special purity", "Sulfur compounds", "Nitriles"]


category_list.each do |name|
  Category.create!(category_name: name)
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


chemicals_list.each do |chemical|
  Chemical.create!(chemical)
end




puts 'Seeds created'

