class FetchExchangeRateJob < ApplicationJob
  queue_as :default

  def perform
    ActiveCurrency::AddRates.call(currencies: %w[EUR USD])
  end
end