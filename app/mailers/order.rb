class Order < ActionMailer::Base
  default from: ENV["EMAIL_SENDER"],
          cc: ENV["EMAIL_SENDER"]

  def notify(message)
    @message = message
    mail to: message.email, subject: 'heegel.ee Order Confirmation' 
  end
end
