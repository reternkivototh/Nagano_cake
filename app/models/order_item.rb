class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order


  def subtotal
    @order_item.tax_included_price * amount
  end

  def s_total
    @order_item.tax_included_price * @order_item.amount
  end
end
