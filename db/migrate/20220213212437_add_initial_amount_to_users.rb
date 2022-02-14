class AddInitialAmountToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :amount, :decimal, null: false, default: 0
  end
end
