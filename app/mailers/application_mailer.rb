class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def handle_errors(message)
    @message = message

    mail to: admin_email,
         subject: 'Application Errors'
  end

  private

  def admin_email
    "admin@example.com"
  end
end
