class MenuItem < ApplicationRecord
  belongs_to :menu_category
  has_many :orders
  has_many :carts
end
