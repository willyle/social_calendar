class EventsController < ApplicationController
	def index
		@events = Event.all.order(date: :asc)
	end
	
	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def edit
		@event = Event.find(params[:id])
	end
	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
			flash[:notice] = "Your event was updated successfully."
		else
			flash[:alert] = "Event update failed"
		end

		redirect_to '/events'
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
