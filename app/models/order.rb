class Order < ApplicationRecord
    has_many :cart_items, dependent: :destroy
end
