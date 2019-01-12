# frozen_string_literal: true

class ChemicalDecorator < BaseDecorator
  delegate_all
  include Draper::LazyHelpers

  def chemical_category_name
    # @category.present? ? @category.name.to_s : @category.name = "-"
  end
end
