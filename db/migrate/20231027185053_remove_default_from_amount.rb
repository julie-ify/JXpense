class RemoveDefaultFromAmount < ActiveRecord::Migration[6.1]
  def change
		change_column_default :users, :amount, nil
		change_column_default :products, :amount, nil
  end
end
