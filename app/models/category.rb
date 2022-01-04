class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true

  belongs_to :user

  has_many :payments
  has_many :products, through: :payments

  def total_amount
    products.sum(:amount)
  end
end
