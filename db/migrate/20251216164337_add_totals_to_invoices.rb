class AddTotalsToInvoices < ActiveRecord::Migration[8.1]
  def change
    add_column :invoices, :subtotal, :decimal , precision: 10 , scale: 2, default: 0
    add_column :invoices, :tax, :decimal , precision: 10 , scale: 2 , default: 0
    add_column :invoices, :discount, :decimal , precision: 10 , scale: 2 , default: 0
    add_column :invoices, :grandtotal, :decimal , precision: 10 , scale: 2 , default:0
  end
end
