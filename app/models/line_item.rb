class LineItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product
  validates :quantity , :unit_price ,presence: true

  before_validation :calculate_total_amount

  private
  def calculate_total_amount
    self.total_amount = (quantity.to_i * unit_price.to_f)
  end
end
