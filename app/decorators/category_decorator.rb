# frozen_string_literal: true

class CategoryDecorator < Draper::Decorator
  delegate_all

  def titleize_category_name
    category.present? ? category.decorate.category_name.to_s.titleize : '-'
  end
end
