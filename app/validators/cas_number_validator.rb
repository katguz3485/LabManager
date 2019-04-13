# frozen_string_literal: true

class CasNumberValidator < ActiveModel::Validator
  attr_reader :record
  attr_accessor :errors

  def validate(record)
    @errors = []
    @record = record

    has_proper_format?
    check_digit_evaluate?

    record.errors.add(attr_name, :cas_number, errors) if errors.any?
  end

  private

  def has_proper_format?
    errors << 'Enter properly formatter CAS' unless record.cas_number&.match(/[0-9]{2,7}-[0-9]{2}-[0-9]/)
  end

  def check_digit_evaluate?
    check_digit = record.cas_number[-1, 1].to_i
    sum = 0
    record.cas_number.to_s.reverse.scan(/[0-9]/).each_with_index do |digit, i|
      sum = sum + digit.to_i * i
    end
    errors << 'CAS is invalid enter the proper CAS' unless check_digit == sum.remainder(10)
  end
end


module ActiveModel::Validations::HelperMethods
  def validates_cas_number(*attr_names)
    validates_with CasNumberValidator, _merge_attributes(attr_names)
  end
end
