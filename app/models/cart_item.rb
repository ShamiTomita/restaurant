class CartItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  def total_price
    menu_item.price * quantity
  end 

  validates :quantity, numericality: {greater_than_or_equal_to: 0}
end
