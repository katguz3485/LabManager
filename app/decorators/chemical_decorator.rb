# frozen_string_literal: true

class ChemicalDecorator < BaseDecorator
  delegate_all
  include Draper::LazyHelpers



  def unit_of_measurement_adder(feature, unit)
    feature.concat(' ', unit)
  end

  #
  #
  #   def avg_notes(subject_item)
  #     student_notes = subject_item.subject_item_notes
  #     if !student_notes.empty?
  #       format('%.2f', student_notes.average(:value))
  #     else
  #       format('%.2f', 0)
  #     end
  #   end

  def molecular_weight_formatter
    molecular_weight = @chemical.molecular_weight
    @chemical.present? ? molecular_weight.unit_of_measurement_adder('g/mol') : 'n/a'
  end

  def density_formatter
    density = @chemical.density
    @chemical.present? ? density.unit_of_measurment_adder('g/mL') : 'n/a'
  end

  def formula_formater
    formula = @chemical.formula
    formula.gsub(/(?<=[A-Z|\]])\d+/, '<sub>\0</sub>').gsub(/(?<=\[)\d+/, '<sup>\0</sup>')
  end


end
