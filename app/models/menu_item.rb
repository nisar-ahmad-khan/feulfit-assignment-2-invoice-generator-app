class MenuItem < ApplicationRecord
  belongs_to :menu_category 
  has_many :orders ,dependent: :destroy
  has_many :carts, dependent: :destroy
end
