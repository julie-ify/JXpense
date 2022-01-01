class Product < ApplicationRecord
 
  validates :name,  presence: true, length: { maximum: 50 }
  validates :amount,  presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :categories, presence: true

  belongs_to :user, foreign_key: :author_id, class_name: 'User'

  has_many :payments
  has_many :categories, through: :payments
end