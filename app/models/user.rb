class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  validates :email, uniqueness: { case_sensitive: false }
  # This will ensure that the uniqueness validation is case-insensitive,
  # preventing the creation of two users with the same email address regardless of the letter case.
  validates :amount, presence: true, numericality: { greater_than: 0 }

  has_many :categories
  has_many :products

  attribute :amount, default: -> { 0.0 }
end
