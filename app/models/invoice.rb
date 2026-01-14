class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :user

  has_many :line_items, inverse_of: :invoice, dependent: :destroy
  accepts_nested_attributes_for :line_items, allow_destroy: true

  validates :discount,
            numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 },
            allow_nil: true

  after_commit :recalculate_totals, on: :create
  after_commit :send_invoice_email, on: :create

    def discount_amount
    disc = subtotal.to_f * (discount / 100.0)
    return subtotal.to_f - disc
  end

  private


  def send_invoice_email
    InvoiceMailer.invoice_email(self).deliver_now
  end

  def recalculate_totals
    subtotal_amount = line_items.sum(:total_amount)
    tax_amount      = tax.to_f
    discount_amount = subtotal_amount * (discount.to_f / 100.0)

    update_columns(
      subtotal: subtotal_amount.round(2),
      grand_total: (subtotal_amount + tax_amount - discount_amount).round(2)
    )
  end
end
