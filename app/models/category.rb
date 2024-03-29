class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50, minimum: 1 }

  belongs_to :user
  has_many :products

  def total_amount
    products.sum(:amount)
  end

  def total
    user.budget.local_amount - products.sum(:amount)
  end
end
