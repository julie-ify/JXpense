class Budget < ApplicationRecord
  belongs_to :exchange_rate
  belongs_to :user

  validates :local_amount, presence: true, numericality: { greater_than: 0 }
end
