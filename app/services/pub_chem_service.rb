# frozen_string_literal: true

class PubChemService
  include HTTParty

  base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

  def initialize(property)
    @property = property
  end

  def cas_to_cid(cas = '71-43-2')
    response = self.class.get("/compound/name/#{cas}/cids/JSON")
    if response.success?
      result = response["IdentifierList"]["CID"]
    else
      raise response.response
    end
    cid = result.join("")
  end

  def find_properties(cid)
    response = self.class.get("/compound/cid/#{cid}/property/IUPACName,MolecularWeight,MolecularFormula,InChIKey,CanonicalSMILES/JSON")
    if response.success?
      response["PropertyTable"]["Properties"]
    else
      raise response.response
    end
    @property = to_hash_object(response["PropertyTable"]["Properties"])
    #binding.pry
  end

  def to_hash_object(property)
    property = property.join(",")
    property = JSON.parse(property.gsub(/:([a-zA-z]+)/, '"\\1"').gsub('=>', ': ')).stringify_keys
    property
  end

end


