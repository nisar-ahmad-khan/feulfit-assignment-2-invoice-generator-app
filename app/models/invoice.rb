class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :line_items, inverse_of: :invoice , dependent: :destroy
  has_many :products , through: :line_items

  accepts_nested_attributes_for :line_items , allow_destroy: true


  before_save :calculate_invoice_totals

  private 

  def calculate_invoice_totals
    self.subtotal = line_items.sum(&:total_amount)
    self.grand_total = subtotal + tax.to_f - discount.to_f
  end
end
