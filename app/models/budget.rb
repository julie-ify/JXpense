class Budget < ApplicationRecord
  belongs_to :exchange_rate
  belongs_to :user
end
