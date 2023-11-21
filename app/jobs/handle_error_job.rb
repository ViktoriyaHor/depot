class HandleErrorJob < ApplicationJob
  queue_as :default

  def perform(message)
    ApplicationMailer.handle_errors(message).deliver_later
  end
end
