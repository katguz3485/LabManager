# frozen_string_literal: true

class CategoryDecorator < Draper::Decorator
  delegate_all

  def titleize_category_name
    object.present? ? object.category_name : '-'
  end
end
