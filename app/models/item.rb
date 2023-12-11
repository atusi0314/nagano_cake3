class Item < ApplicationRecord
    has_many :cart_item
    has_one_attached :image
    
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
  
    # 単価
  def with_tax_price
    (price*1.1).floor
  end
end
