# frozen_string_literal: true

module ApplicationHelper
  def active?(*paths)
    'active' if paths.any? { |path| current_page?(path) }
  end
end
