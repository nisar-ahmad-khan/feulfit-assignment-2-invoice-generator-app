class AddGrandTotalToInvoices < ActiveRecord::Migration[8.1]
  def change
    add_column :invoices, :grand_total, :decimal
  end
end
