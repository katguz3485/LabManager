# frozen_string_literal: true

class SafetyPrecautionDecorator < Draper::Decorator
  delegate_all
  decorates_association :chemical

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  #
  def show_msds_file
    safety_precaution.sds_file.present? ? safety_precaution.sds_file : "-"
  end

end
