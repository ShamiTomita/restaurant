require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "associations" do
    it { should have_many(:cart_items).dependent(:destroy) }
  end
end
