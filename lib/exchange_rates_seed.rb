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

  def process_condition(cur, rate)
    ExchangeRate.find_or_create_by(currency: cur, rate_in_usd: rate)
  end

  def create_currencies(currencies)
    currency_rates = {
      'NGN' => 1200,
      'GBP' => 0.81,
      'CAD' => 1.35,
      'EUR' => 0.92,
      'AUD' => 1.50,
      'USD' => 1
    }

    currencies.each do |currency|
      rate = currency_rates[currency]
      raise StandardError, "Unknown currency: #{currency}" unless rate

      process_condition(currency, rate)
    end
  end
end
