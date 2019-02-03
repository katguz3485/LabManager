# frozen_string_literal: true

module ChemicalServices
  class PubChemService
    include HTTParty

    base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

    attr_accessor :cas

    def initialize(property)
      @property = property
      # @name = @chemical.chemical_name
    end

    def cas_to_cid(cas)
      response = self.class.get("/compound/name/#{cas}/cids/JSON")
      if response.success?
        result = response['IdentifierList']['CID']
      else
        raise response.response
      end
      cid = result.join('')
    end

    #   def name_to_cid(name = @chemical.chemical_name)
    #
    #     name
    #   end

    def find_properties(cid)
      response = self.class.get("/compound/cid/#{cid}/property/IUPACName,MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON")
      if response.success?
        response['PropertyTable']['Properties']
      else
        raise response.response
      end
      @property = to_hash_object(response['PropertyTable']['Properties'])
    end

    def to_hash_object(property)
      property = JSON.parse(property.join(',').gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).stringify_keys
      property
    end

    def show_molecular_weight
      @property['MolecularWeight']
    end

    def show_iupac_name
      @property['IUPACName']
    end

    def show_molecular_formula
      @property['MolecularFormula']
    end

    def show_in_chi_key
      @property['InChIKey']
    end

    def show_canonical_smiles
      @property['CanonicalSMILES']
    end
  end
end
