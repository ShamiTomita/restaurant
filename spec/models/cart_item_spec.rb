require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe "associations" do
    it { should belong_to(:order) }
    it { should belong_to(:menu_item) }
  end

  describe "#total_price" do
    it "calculates the total price based on quantity and menu item price" do
      menu_item = MenuItem.create(name: "Burger", price: 8.99)
      order = Order.create
      cart_item = CartItem.create(order: order, menu_item: menu_item, quantity: 2)

      expect(cart_item.total_price).to eq(17.98)  # 8.99 * 2
    end
  end

  describe "validations" do
    it "is valid with an order, menu_item, and quantity" do
      menu_item = MenuItem.create(name: "Burger", price: 8.99)
      order = Order.create
      cart_item = CartItem.new(order: order, menu_item: menu_item, quantity: 2)
      expect(cart_item).to be_valid
    end

    it "is invalid without an order" do
      menu_item = MenuItem.create(name: "Burger", price: 8.99)
      cart_item = CartItem.new(menu_item: menu_item, quantity: 2)
      expect(cart_item).not_to be_valid
    end

    it "is invalid without a menu_item" do
      order = Order.create
      cart_item = CartItem.new(order: order, quantity: 2)
      expect(cart_item).not_to be_valid
    end

    it "is invalid with a quantity less than 1" do
      menu_item = MenuItem.create(name: "Burger", price: 8.99)
      order = Order.create
      cart_item = CartItem.new(order: order, menu_item: menu_item, quantity: -1)
      expect(cart_item).not_to be_valid
    end
  end
end
