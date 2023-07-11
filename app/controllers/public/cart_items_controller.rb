class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all

    @items = Item.all
  end

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def update
    if cart_item = CartItem.find(params[:id])
      cart_item.update(cart_item_params)
      redirect_to public_cart_items_path
    else
      render :edit
    end
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
