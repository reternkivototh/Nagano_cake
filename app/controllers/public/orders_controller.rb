class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.receiver = current_customer.last_name + current_customer.first_name
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = 0
    @order.postage = '800'
    @order.receiver = current_customer.last_name + current_customer.first_name
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    if @order.save
    current_customer.cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.item_id = cart_item.item_id
      @order_item.amount = cart_item.amount
      @order_item.tax_included_price = cart_item.item.with_tax_price
      @order_item.order_id =  @order.id
      @order_item.save
    end
    cart_items.destroy_all
    redirect_to complete_public_orders_path
    else render'public/items/index'
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def index
    @order = current_customer.orders.page(params[:page])
  end

  def order_params
      params.require(:order).permit(:payment_method, :address, :postal_code, :receiver, :payment_amount, :postage)
  end

end
