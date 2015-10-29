class SessionController < ApplicationController
	def create
		if params[:login].include? '@'
			profile = Profile.find_by(email: params[:login])
			if profile
				user = profile.user
			end
		else
			user = User.find_by(username: params[:login])
		end

		if user
			if params[:password] == user.password
				session[:user_id] = user.id
				user.update(last_login: Time.now)
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
