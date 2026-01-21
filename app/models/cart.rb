class Cart < ApplicationRecord
  belongs_to :customer
  belongs_to :menu_item
end
