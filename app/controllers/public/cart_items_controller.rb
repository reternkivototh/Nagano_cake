class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        cart_item.amount += params[:cart_item][:amount].to_i
        cart_item.save
        redirect_to public_cart_items_path
    elsif @cart_item.save
        redirect_to public_cart_items_path
    else
      @item = Item.all
      render '/public/items/index'
    end
  end

  def update
      cart_item = CartItem.find(params[:id])
      cart_item.update(cart_item_params)
      redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_item = current_customer.cart_items
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
