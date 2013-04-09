class SessionsController < ApplicationController
	def new
		
	end

	def create
		session[:password] = params[:password]
		if admin?
			flash[:notice] = 'Logged in'
			redirect_to products_path
		else
			flash[:notice] = 'nope'
			redirect_to controller: :sessions, action: :new
		end
	end

	def destroy
		reset_session
		flash[:notice] = 'Logged out'
		redirect_to products_path
	end
end
