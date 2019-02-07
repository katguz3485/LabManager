# frozen_string_literal: true

module SafetyPrecautionsServices
  class MsdsDownloadService
    def initialize(safety_precaution)
      @safety_precaution = safety_precaution
    end

    def call
      @safety_precaution.sds_file.file&.authenticated_url
    end
  end
end
