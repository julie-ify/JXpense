class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.datetime :created_at, null: false
      t.references :user, null: false, foreign_key: true
    end

    create_table :products do |t|
      t.string :name, null: false
      t.decimal :amount, null: false, default: 0
      t.datetime :created_at, null: false
      t.references :author, references: :users, null: false, foreign_key: { to_table: :users }
    end

    create_table :payments do |t|
      t.belongs_to :category
      t.belongs_to :product
      t.timestamps
    end
  end
end
