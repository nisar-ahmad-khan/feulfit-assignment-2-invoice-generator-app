class Product < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :client_orders, dependent: :destroy
  has_many :orders , dependent: :destroy
  belongs_to :user
  has_many :invoices, through: :line_items , dependent: :destroy
  validates :name , :unit_price, presence: true
end
