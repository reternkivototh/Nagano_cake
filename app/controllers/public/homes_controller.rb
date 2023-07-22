class Public::HomesController < ApplicationController
  def top
    @item = Item.find(1,2,3,4)
  end

  def about
  end
end
