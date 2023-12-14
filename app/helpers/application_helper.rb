module ApplicationHelper
  def currency_exchange(price)
    if I18n.locale == :es
      number_to_currency(price.to_money('USD').exchange_to('EUR'))
    else
      number_to_currency(price)
    end
  end
end
