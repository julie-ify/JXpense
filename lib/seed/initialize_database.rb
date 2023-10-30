module Seed
  class InitializeDatabase
    def self.run
      new.execute
    end

    def execute
      ActiveRecord::Base.transaction do
        create_exchange_rate
        create_initial_data
      end
    end

    private

    def create_exchange_rate
      puts 'Creating exchange rate'
      ExchangeRatesSeed.execute
    end

    def create_initial_data
      puts 'Creating initial data'
      InitialDataSeed.execute
    end
  end
end
