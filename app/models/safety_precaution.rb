# frozen_string_literal: true

class SafetyPrecaution < ApplicationRecord
  belongs_to :chemical, optional: true

  mount_uploader :sds_file, SdsFileUploader



end
