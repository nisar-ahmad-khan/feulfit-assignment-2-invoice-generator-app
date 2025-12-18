class CreateInvoices < ActiveRecord::Migration[8.1]
  def change
    create_table :invoices do |t|
      t.string :invoice_number
      t.date :issue_date
      t.date :due_date
      t.string :status
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
    add_index :invoices, :invoice_number, unique: true
  end
end
