# frozen_string_literal: true

require 'json'

module ChemicalServices
  class PubChemServicePicture
    include HTTParty

    base_uri 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

    def initialize(cid:)
      @cid = cid
    end

    def call
      picture_open
    end

    private

    def picture_open
      # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
      response = self.class.get("/compound/cid/#{@cid}/PNG")

      if response.success?
        picture = response
      else
        raise response.response
      end
      JSON.parse(picture)
    end
  end
end
