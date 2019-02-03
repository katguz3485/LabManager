# frozen_string_literal: true

class ChemicalDecorator < BaseDecorator
  delegate_all
  decorates_association :safety_precaution
  include Draper::LazyHelpers

  #
  #   def initialize(object, options = {})
  #     @details = PubChemService.new(object).cas_to_cid
  #     @property = PubChemService.new(object).find_properties(@details)
  #
  #     super
  #   end

  def unit_of_measurement_adder(resource, unit)
    resource.concat(' ', unit)
  end

  def molecular_weight_formatter
    molecular_weight = molecular_weight.to_s
    molecular_weight.nil? ? '-' : unit_of_measurement_adder(molecular_weight, 'g/mol')
  end

  def density_formatter(density)
    density = density.to_s
    density.present? ? unit_of_measurement_adder(density, 'g/mL') : '-'
  end

  def titleize_chemical_name
    chemical.present? ? chemical.decorate.chemical_name.to_s.titleize : '-'
  end

  def show_formula_picture
    chemical.formula_picture.present? ? chemical.formula_picture_url(:thumb) : Faker::LoremPixel.image('50x60', false, 'sports')
  end

  def download_picture
    ChemicalServices::FileDownloadService.new(self).call
  end

  def formula_formater(formula)
    # TODO implement this
    # TODO remove redundancy in density mw methods
  end
end
