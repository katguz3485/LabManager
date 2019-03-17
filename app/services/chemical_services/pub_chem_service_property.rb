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
      assign_properties(chemical)
    end

    private

    def find_properties(cid)
      response = self.class.get("/compound/cid/#{cid}/property/IUPACName,MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON")
      if response.success?
        property = response["PropertyTable"]["Properties"].join(",")
      else
        raise response.response
      end
      @table = JSON.parse(property.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).symbolize_keys
    end


    def assign_properties(chemical)
      chemical.chemical_name = @table[:IUPACName]
      chemical.molecular_weight = @table[:MolecularWeight]
      chemical.canonical_smiles = @table[:CanonicalSMILES]
      chemical.inchi_key = @table[:InChIKey]

    end
  end
end




