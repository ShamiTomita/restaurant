class CartItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  def total_price
    menu_item.price * quantity
  end 
end
