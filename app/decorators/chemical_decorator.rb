# frozen_string_literal: true

class ChemicalDecorator < BaseDecorator
  delegate_all
  include Draper::LazyHelpers

  def unit_of_measurement_adder(resource, unit)
    resource.concat(' ', unit)
  end

  def molecular_weight_formater(molecular_weight)
    molecular_weight = molecular_weight.to_s
    molecular_weight.nil? ? '-' : unit_of_measurement_adder(molecular_weight, 'g/mol')
  end

  def density_formater(density)
    density = density.to_s
    density.present? ? unit_of_measurement_adder(density, 'g/mL') : '-'
  end
end
