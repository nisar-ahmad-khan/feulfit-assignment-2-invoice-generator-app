class ChangePhoneToStringInClients < ActiveRecord::Migration[8.1]
  def change
    change_column :clients, :phone, :string
  end
end
