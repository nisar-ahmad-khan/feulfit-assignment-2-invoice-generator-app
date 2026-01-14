class Client < ApplicationRecord
  belongs_to :user
  has_many :invoices, dependent: :destroy
  validates :name ,:email, presence: true
  validates :email, uniqueness: true
  validates :phone, uniqueness: true
end
