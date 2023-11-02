class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.datetime :created_at, null: false
      t.references :user, null: false, foreign_key: true
    end

    create_table :products do |t|
      t.string :name, null: false
      t.float :amount, null: false
			t.text :description, null: false
      t.datetime :created_at, null: false
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }
    end
  end
end
