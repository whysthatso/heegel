class ApplicationController < ActionController::Base
  protect_from_forgery


  helper_method :admin?

  protected

  def authorize
  	unless admin?
  		flash[:notice] = "Please log in"
  		redirect_to products_path
  		false
  	end
  end

  def admin?
  	session[:password] == ''
  end
end
