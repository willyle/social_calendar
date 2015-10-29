class ProfilesController < ApplicationController
	def show
		if params[:username]
			@profile = User.find_by(username: params[:username]).profile
		else
			@profile = Profile.find_by(user_id: session[:user_id])
		end
	end
end
