require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  describe "associations" do
    it { should have_many(:cart_items) }
  end

  describe "validations" do
    it "is valid with a name and price" do
      menu_item = MenuItem.new(name: "Burger", price: 8.99)
      expect(menu_item).to be_valid
    end

    it "is invalid without a name" do
      menu_item = MenuItem.new(price: 8.99)
      expect(menu_item).not_to be_valid
    end

    it "is invalid without a price" do
      menu_item = MenuItem.new(name: "Burger")
      expect(menu_item).not_to be_valid
    end
  end
end
