module ChemicalServices
  class FileDownloadService


    def initialize(chemical)
      @chemical = chemical
    end

    def call
      @chemical.formula_picture.file.authenticated_url
    end

  end
end