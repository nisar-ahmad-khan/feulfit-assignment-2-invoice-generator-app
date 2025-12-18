class AddUserToInvoices < ActiveRecord::Migration[8.1]
  def change
    add_reference :invoices, :user, null: false, foreign_key: true
  end
end
