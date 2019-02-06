# frozen_string_literal: true

class ItemDecorator < Draper::Decorator
  delegate_all

  def item_place
    item.present? ? "#{item.room}-#{item.shelf}-#{item.number}" : '-'
  end

  def amount_formatter
    item.present? ? "#{item.amount} g/(mL)" : "-"
  end

  def item_stock
    "#{item.quantity} x #{amount_formatter}"
  end

end
