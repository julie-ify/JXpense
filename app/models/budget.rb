class Budget < ApplicationRecord
  belongs_to :exchange_rate
  belongs_to :user

  attribute :exchange_rate_id, default: -> { 6 }
  attribute :amount, default: -> { 0.0 }
end
