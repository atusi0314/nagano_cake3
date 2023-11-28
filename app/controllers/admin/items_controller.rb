class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end
  
  def index
    @item = Item.all
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end
end
