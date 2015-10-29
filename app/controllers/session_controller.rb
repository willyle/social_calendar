class SessionController < ApplicationController
	def create
		if params[:login].include? '@'
			user = Profile.find_by(email: params[:login]).user
		else
			user = User.find_by(username: params[:login])
		end

		if user
			if params[:password] == user.password
				session[:user_id] = user.id
				flash[:notice] = "You have logged in successfully."
			else
				flash[:alert] = "Your login information is incorrect. Please try again."
			end	
		else
			flash[:alert] = "Your login information is incorrect. Please try again."
		end

		redirect_to root_path
	end
	
	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have logged out successfully. Please come back soon."
		redirect_to root_path
	end
end
