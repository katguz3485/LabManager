# frozen_string_literal: true

class HomeDecorator < Draper::Decorator
  delegate_all

  def titleize_category_name
    object.present? ? object.decorate.category_name.to_s.titleize : '-'
  end
end
