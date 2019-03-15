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

    #
    # def set_random_picture(alpaca)
    #   response = JSON.parse(GetAlpacaPictures.new.call)
    #   if response.nil?
    #     # If response is nil (HTTP error), return nil, so the model validation won't pass
    #     return nil
    #   else
    #     items = response['items']
    #     alpaca.picture_url = items.sample['link']
    #   end
    #
    #
    # end

end


