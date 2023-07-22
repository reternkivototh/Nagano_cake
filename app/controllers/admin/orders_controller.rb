class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items
  end

  def order_params
      params.require(:order).permit(:payment_method, :address, :postal_code, :receiver, :payment_amount, :postage, )
  end
end
