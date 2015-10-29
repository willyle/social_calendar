class EventsController < ApplicationController
	def index
		@events = Event.all
	end
	
	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.creator_id = session[:user_id]

		if @event.save
			flash[:notice] = "You have successfully added an event."
			redirect_to '/events'
		else
			flash[:alert] = "An error has occurred. Please try again."
			redirect_to :back
		end
	end

	def destroy
	end

	private
		def event_params
			params.require(:event).permit(:title, :description, :address_1, :address_2, :city, :state, :date, :time)
		end
end