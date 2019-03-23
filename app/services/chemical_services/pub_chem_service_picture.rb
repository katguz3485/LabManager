require 'open-uri'

module ChemicalServices
  class PubChemServicePicture

    URL = 'https://pubchem.ncbi.nlm.nih.gov/rest/pug'

    def initialize(cid:)
      @cid = cid

    end

    def call(chemical)
      picture_open(chemical)
    end

    private

    def picture_open(chemical)
      # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
      #
      picture_url = URL + "/compound/cid/#{@cid}/PNG"

      begin
        picture = open(picture_url).base_uri.to_s

      rescue OpenURI::HTTPError => error
        return nil
      end
      chemical.assign_attributes(picture_url: picture)
      chemical.save(validate: false)

      binding.pry

    end

    # def update_picture_url
    #
    # require 'open-uri'
    #
    # class GetAlpacaPictures
    #   API_KEY = Rails.application.config.google_custom_search_api_key
    #   ENGINE_ID = Rails.application.config.google_custom_search_engine_id
    #   URL = 'https://www.googleapis.com/customsearch/v1?key=' + API_KEY + '&cx=' + ENGINE_ID +
    #         '&searchType=image&q=alpaca&imgSize=medium&start='
    #
    #   def call
    #     address_with_random_index = URL + (1..90).to_a.sample.to_s
    #     begin
    #       open(address_with_random_index).read
    #     rescue OpenURI::HTTPError => error
    #       return nil
    #     end
    #   end
    # end
    #
    #
    #
    #
    # end


  end
end
