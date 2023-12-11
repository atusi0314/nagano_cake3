class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @address=current_customer.address
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] ="1"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else
      render "new"
    end
    
    @cart_items = current_customer.cart_item.all
  end
   
  
  def create
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.save
    
    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
          @ordered_item = OrderedItem.new #初期化宣言
          @ordered_item.item_id = cart_item.item_id #商品idを注文商品idに代入
          @ordered_item.amount = cart_item.amount #商品の個数を注文商品の個数に代入
          @ordered_item.with_tax_price = cart_item.item.with_tax_price
          @ordered_item.order_id =  @order.id #注文商品に注文idを紐付け
          @ordered_item.save #注文商品を保存
        end 
    
    redirect_to confirm_path
  end
  

  private
  
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
