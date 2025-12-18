class Product < ApplicationRecord
  has_many :line_items
  belongs_to :user
  has_many :invoices, through: :line_items
  validates :name , :unit_price, presence: true
end
