class Client < ApplicationRecord
  belongs_to :user
  has_many :client_orders, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :carts , dependent: :destroy
  has_many :invoices, dependent: :destroy
  validates :name ,:email, presence: true
  validates :email, uniqueness: true , presence: true 
  validates :phone, uniqueness: true, presence: true
end