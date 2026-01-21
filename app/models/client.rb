class Client < ApplicationRecord
  belongs_to :user
  has_many :client_orders
  has_many :orders
  has_many :carts
  has_many :invoices, dependent: :destroy
  validates :name ,:email, presence: true
  validates :email, uniqueness: true
  validates :phone, uniqueness: true
end
