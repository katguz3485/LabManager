# frozen_string_literal: true

class SafetyPrecautionDecorator < Draper::Decorator
  delegate_all
  decorates_association :chemical

  def show_msds_file
    SafetyPrecautionsServices::MsdsDownloadService.new(self).call
  end


end
