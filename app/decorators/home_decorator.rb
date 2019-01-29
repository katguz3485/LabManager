# frozen_string_literal: true

class HomeDecorator < Draper::Decorator
  delegate_all

  def items_counter
      chemical.present?
  end

  def titleize_category_name
    category.present? ? category.decorate.category_name.to_s.titleize : '-'
  end



end
