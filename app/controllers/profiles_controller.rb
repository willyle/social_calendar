class ProfilesController < ApplicationController
	def show
		@offset = 0

		if params[:move]
			@offset += params[:move][4,params[:move].length].to_i
		end

		if params[:username]
			@profile = User.find_by(username: params[:username]).profile
		else
			@profile = Profile.find_by(user_id: session[:user_id])
		end

		showing_month = Time.now + @offset.month
		today = Time.now.strftime('%d').to_i
		days_in_this_month = Time.days_in_month(showing_month.strftime('%m').to_i,showing_month.strftime('%Y').to_i)
		@events = @profile.user.events.where("date between ? and ?", showing_month - (today).day, showing_month + (days_in_this_month-today).day)
	end

	def edit
		@profile = User.find(session[:user_id]).profile
	end

	def update
		@profile = Profile.find(session[:user_id])
		if @profile.update(profile_params)
			flash[:notice] = "Your profile was updated successfully."
		else
			flash[:alert] = "Profile update failed"
		end

		redirect_to '/profile'
	end
	private
		def profile_params
			params.require(:profile).permit(:first_name, :last_name, :gender, :email, :birthday, :work, :skills, :interests)
		end
end
