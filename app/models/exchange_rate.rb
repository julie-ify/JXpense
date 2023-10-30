class ExchangeRate < ApplicationRecord
  has_many :users
  has_many :budgets
end
