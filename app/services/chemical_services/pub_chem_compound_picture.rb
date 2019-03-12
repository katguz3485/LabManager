require 'open-uri'

class PubChemServicePicture

  URL = 'https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/' + "#{@cid}" + '/PNG'


  def initialize(cid:)
    @cid = PubChemServiceCid.new(cas: @chemical.cas_number)
  end

  def call
    picture_download
  end

  private

  def picture_download
    # https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/2244/PNG
    begin
      open(URL).read
    rescue OpenURI::HTTPError => error
      return nil
    end
  end
end
