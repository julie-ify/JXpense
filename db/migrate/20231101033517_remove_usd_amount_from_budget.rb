class RemoveUsdAmountFromBudget < ActiveRecord::Migration[6.1]
  def change
		remove_column :budgets, :usd_amount
  end
end
