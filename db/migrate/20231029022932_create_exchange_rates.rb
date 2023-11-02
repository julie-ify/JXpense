class CreateExchangeRates < ActiveRecord::Migration[6.1]
  def change
    create_table :exchange_rates do |t|
      t.string :currency
      t.float :rate_in_usd

      t.timestamps
    end
  end
end
