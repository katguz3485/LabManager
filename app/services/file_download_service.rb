class FileDownloadService

  def initialize(chemical)
    @chemical = chemical
  end

  def call
    @chemical.formula_picture.file.authenticated_url unless @chemical.formula_picture.file.nil?
  end

end