# frozen_string_literal: true

class CasNumberValidator < ActiveModel::Validator
  def validate(record)
    cpd_cas_number = record.cas_number
    unless is_valid?(cpd_cas_number)
      record.errors.add(:cas_number, 'is invalid, enter the proper number')
    end
  end

  private

  def is_valid?(cpd_cas_number)
    check_cas_number(cpd_cas_number)
  end

  def check_cas_number(cas_number)
    return false unless cas_number&.match(/[0-9]{2,7}-[0-9]{2}-[0-9]/)

    check_digit = cas_number[-1, 1].to_i
    sum = 0
    cas_number.reverse.scan(/[0-9]/).each_with_index do |digit, i|
      sum = sum + digit.to_i * i
    end
    check_digit == sum.remainder(10)
  end
end
