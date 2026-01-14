class RemovePhonFromUsers < ActiveRecord::Migration[8.1]
  def change
    remove_column :users, :phone, :integer
  end
end
