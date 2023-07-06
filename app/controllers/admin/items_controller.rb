class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])

  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def edit
  end


  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price, :item_id, :genre_id)
  end

end
