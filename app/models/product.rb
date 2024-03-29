class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  validates :description, presence: true, length: { maximum: 140, minimum: 10 }
  validates :amount, presence: true, numericality: { greater_than: 0 }

  belongs_to :user, foreign_key: :author_id, class_name: 'User'
  belongs_to :category
end
