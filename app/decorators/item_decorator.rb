# frozen_string_literal: true

class ItemDecorator < Draper::Decorator
  delegate_all

  def item_place
    object.present? ? "#{object.room}-#{object.shelf}-#{object.number}" : '-'
  end

  def amount_formatter
    object.present? ? "#{object.amount} g/(mL)" : '-'
  end

  def item_stock
    "#{object.quantity} x #{amount_formatter}"
  end
end
