# frozen_string_literal: true

require 'rails_helper'

describe CasNumberValidator do
  subject { Validatable.new(cas_number: cas_number) }

  shared_examples 'has valid cas' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
  end

  shared_examples 'has invalid cas' do
    it 'should not be valid' do
      expect(subject).not_to be_valid
    end
  end

  context 'with proper formatting and check digit' do
    let(:cas_number) { '71-43-2' }
    it_behaves_like 'has valid cas'
  end

  context 'with proper formatting and wrong check digit' do
    let(:cas_number) { '71-43-0' }
    it_behaves_like 'has invalid cas'
  end

  context 'without proper formatting and digit' do
    let(:cas_number) { '71430' }
    it_behaves_like 'has invalid cas'
  end

  context 'without proper formatting but with proper check digit' do
    let(:cas_number) { '71432' }
    it_behaves_like 'has invalid cas'
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
