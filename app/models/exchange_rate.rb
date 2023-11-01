class ExchangeRate < ApplicationRecord
  has_many :budgets

  validates :rate_in_usd, presence: true, numericality: true
  validates :currency, presence: true
  validates :name, presence: true
  validates :symbol, presence: true
end
