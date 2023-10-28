class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
			t.float :amount, null: false

      t.timestamps
    end
  end
end
