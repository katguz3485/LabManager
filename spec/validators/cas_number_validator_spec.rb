require "rails_helper"
#   def validate(record)
#     @errors = []
#     @record = record
#
#     has_proper_format?
#     check_digit_evaluate?
#
#     record.errors.add(:cas_number, errors) if errors.any?
#   end
#
#   private
#
#   def has_proper_format?
#     errors << "Enter properly formatter CAS" unless record.cas_number&.match(/[0-9]{2,7}-[0-9]{2}-[0-9]/)
#   end
#
#   def check_digit_evaluate?
#
#     check_digit = record.cas_number[-1, 1].to_i
#     sum = 0
#     record.cas_number.to_s.reverse.scan(/[0-9]/).each_with_index do |digit, i|
#       sum = sum + digit.to_i * i
#     end
#     errors << "CAS is invalid enter the proper CAS" unless check_digit == sum.remainder(10)
#   end
# end

describe CasNumberValidator do
  subject {Validatable.new(cas_number: cas_number)}

  shared_examples "has valid cas" do
    it "should be valid" do
      expect(subject).to be_valid
    end
  end

  shared_examples "has invalid cas" do
    it "should not be valid" do
      expect(subject).not_to be_valid
    end
  end

  context "with proper formatting and check digit" do
    let(:cas_number) {"71-43-2"}
    it_behaves_like "has valid cas"
  end

  context "with proper formatting and wrong check digit" do
    let(:cas_number) {"71-43-0"}
    it_behaves_like "has invalid cas"
  end

  context "without proper formatting and digit" do
    let(:cas_number) {"71430"}
    it_behaves_like "has invalid cas"
  end

  context "without proper formatting but with proper check digit" do
    let(:cas_number) {"71432"}
    it_behaves_like "has invalid cas"
  end




end

class Validatable
  include ActiveModel::Validations
  validates_with CasNumberValidator
  attr_accessor :cas_number

  def initialize(cas_number:)
    @cas_number = cas_number
  end
end