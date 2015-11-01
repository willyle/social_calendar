class AttendancesController < ApplicationController
	def create
		@attendance = Attendance.new(event_id: params[:id], user_id: session[:user_id]) 

		if @attendance.save
			flash[:notice] = "You are now attending the event."
		else
			flash[:alert] = "Your attendance was not accepted."
		end
		
		redirect_to :back
	end
end
