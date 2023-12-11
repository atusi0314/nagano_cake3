class Order < ApplicationRecord
  has_many :cart_item
  
  enum payment_method: { credit_card: 0, transfer: 1 }
end
