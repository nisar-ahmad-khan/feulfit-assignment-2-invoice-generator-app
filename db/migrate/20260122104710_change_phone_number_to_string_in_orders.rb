class ChangePhoneNumberToStringInOrders < ActiveRecord::Migration[8.1]
  def change
    change_column :orders , :phone_number , :string
  end
end