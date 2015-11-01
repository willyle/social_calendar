class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def create
		if params[:email] == params[:email2] && params[:password] == params[:password2]
			@user = User.new(user_params)
			@user.last_login = Time.now
			if @user.save
				Profile.create(email: params[:email], user_id: @user.id)
				session[:user_id] = @user.id
				flash[:notice] = "You have successfully created an account."
			else
				flash[:alert] = "Your request for a new account failed. Please try again."
			end
		else
				flash[:alert] = "Your emails and/or passwords did not match. Please try again."
		end

		redirect_to root_path
	end
	private
		def user_params
			params.permit(:username, :password)
		end
end
