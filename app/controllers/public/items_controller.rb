class Public::ItemsController < ApplicationController

  def index
    @item =Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    # カート
    @cart_item_new = CartItem.new
  end



  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end

end
