class MessagesController < ApplicationController
  def new
    @message = Message.new(params[:message])
  end

  def create
    @message = Message.new(params[:message])
    if verify_recaptcha() and @message.valid?
      Order.notify(@message).deliver
      redirect_to products_path, notice: "Ait&auml;h tellimuse eest, v&otilde;tame 
      Sinuga peatselt &uuml;hendust!<br /> Thank you for your order, we'll get 
      back to you shortly.".html_safe
    else
      render "new"
    end
  end
end
