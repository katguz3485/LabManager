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

    end
  end
end
