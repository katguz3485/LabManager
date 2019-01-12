# frozen_string_literal: true

class BaseDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
end
