# frozen_string_literal: true

module ChemicalServices
  class PubChemServiceProperty
    include HTTParty

    base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

    attr_accessor :table, :chemical

    def initialize
      @table = table
      @chemical = chemical
    end

    def call(cid, chemical)
      find_properties(cid)
      new_chemical(chemical)
    end

    private

    def find_properties(cid)
      response = self.class.get("/compound/cid/#{cid}/property/IUPACName,MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON")
      if response.success?
        property = response['PropertyTable']['Properties'].join(',')
      else
        raise response.response
      end
      @table = JSON.parse(property.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).symbolize_keys
    end

    def new_chemical(chemical)
      chemical.update(chemical_name: @table[:IUPACName], cid: @table[:CID], canonical_smiles: @table[:CanonicalSMILES], inchi_key: @table[:InChIKey], molecular_weight: @table[:MolecularWeight])
    end
  end
end
