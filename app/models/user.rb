class User < ApplicationRecord

  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true

  has_many :categories
  has_many :products
end
