class AddNameAndSymbolToExchangeRate < ActiveRecord::Migration[6.1]
  def change
		add_column :exchange_rates, :name, :string
		add_column :exchange_rates, :symbol, :string

		add_column :budgets, :local_amount, :float
		rename_column :budgets, :amount, :usd_amount
  end
end
