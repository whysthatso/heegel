class Order < ActionMailer::Base
  default from: "andreas@whyservices.eu",
          cc: "andreas@whyservices.eu"

  def notify(message)
    @message = message
    mail to: message.email, subject: 'heegel.ee Order Confirmation' 
  end
end
