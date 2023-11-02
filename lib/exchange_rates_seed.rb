class ExchangeRatesSeed
  CURRENCIES = %w[
    NGN GBP CAD EUR AUD USD
  ].freeze

  def self.execute
    new.execute
  end

  def execute
    create_currencies(CURRENCIES)
  end

  def process_condition(cur, rate_hash)
    # parallel assignment of variables also known as destructuring in ruby
    rate, name, symbol = rate_hash.values_at(:rate, :name, :symbol)
    ExchangeRate.find_or_create_by(currency: cur, rate_in_usd: rate, name: name, symbol: symbol)
  end

  def create_currencies(currencies)
    currency_rates = {
      'NGN' => { rate: 1200, name: 'Nigerian naira', symbol: '₦' },
      'GBP' => { rate: 0.81, name: 'British pounds', symbol: '£' },
      'CAD' => { rate: 1.35, name: 'Canadian dollar', symbol: '$' },
      'EUR' => { rate: 0.92, name: 'Euro', symbol: '€' },
      'AUD' => { rate: 1.50, name: 'Australian dollar', symbol: '$' },
      'USD' => { rate: 1, name: 'United states dollar', symbol: '$' }
    }

    currencies.each do |currency|
      rate_hash = currency_rates[currency]
      raise StandardError, "Unknown currency: #{currency}" unless rate_hash

      process_condition(currency, rate_hash)
    end
  end
end
