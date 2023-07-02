class Admin::ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :price)
  end

end
