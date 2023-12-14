namespace :fetch do
  desc "Fetch currency rates"
  task currency_rates: :environment do
    FetchExchangeRateJob.perform_now
  end
end
