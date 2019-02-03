class MsdsDownloadService

  def initialize(safety_precaution)
    @safety_precaution = safety_precaution
  end

  def call
    @safety_precaution.sds_file.file.authenticated_url unless @safety_precaution.sds_file..nil?
  end



end