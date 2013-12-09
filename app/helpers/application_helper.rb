module ApplicationHelper
  def order_total(line_items)
    total = 0
    line_items.each do |line_item|
      total += (line_item.product_price * line_item.quantity)
    end
    total
  end
end
