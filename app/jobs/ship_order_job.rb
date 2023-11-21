class ShipOrderJob < ApplicationJob
  queue_as :default

  def perform(order, ship_date)
    order.ship!
  end
end
