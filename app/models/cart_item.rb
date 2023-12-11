class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  belongs_to :customer
  
    # 小計
  def subtotal
    item.with_tax_price*amount
  end
end
