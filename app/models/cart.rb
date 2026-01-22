class Cart < ApplicationRecord
  belongs_to :client
  belongs_to :menu_item
  
end
