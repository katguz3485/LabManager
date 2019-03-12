module ChemicalServices
  class PubChemServiceProperty
    include HTTParty

    base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

    attr_accessor :table, :cas

    def initialize
      @table = table
    end

    def call(cid)
      find_properties(cid)
    end

    private

    def find_properties(cid)
      response = self.class.get("/compound/cid/#{cid}/property/IUPACName,MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON")
      if response.success?
        property = response["PropertyTable"]["Properties"].join(",")
      else
        raise response.response
      end
      JSON.parse(property.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).symbolize_keys

    end


    def show_molecular_weight
      table[:MolecularWeight]
    end

    def show_iupac_name
      table[:IUPACName]
    end

    def show_molecular_formula
      table[:MolecularFormula]
    end

    def show_in_chi_key
     table[:InChIKey]
    end

    def show_canonical_smiles
      table[:CanonicalSMILES]
    end




  end

end




