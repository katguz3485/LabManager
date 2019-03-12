module ChemicalServices
  class PubChemServiceCid
    include HTTParty

    base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

    attr_accessor :cas

    def initialize(cas:)
      @cas = cas
    end

    def call
      cas_to_cid
    end

    private

    def cas_to_cid
      response = self.class.get("/compound/name/#{@cas}/cids/JSON")
      if response.success?
        result = response['IdentifierList']['CID']
      else
        raise response.response
      end
      cid = result.join('')
    end


  end
end