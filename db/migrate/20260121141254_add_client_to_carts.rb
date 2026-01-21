class AddClientToCarts < ActiveRecord::Migration[8.1]
  def change
    add_reference :carts, :Client, null: false, foreign_key: true
  end
end
