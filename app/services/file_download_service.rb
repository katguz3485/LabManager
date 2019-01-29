class FileDownloadService

  def initialize(chemical)
    @chemical = chemical
  end

  def download_formula_file
    redirect_to @chemical.download_url
  end






end