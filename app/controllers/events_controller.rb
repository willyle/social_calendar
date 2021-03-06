class EventsController < ApplicationController
	def index
		@events = Event.all.order(date: :asc)
		@attendances = User.find(session[:user_id]).attendances
	end
	
	def show
		@event = Event.find(params[:id])
		@attendances = User.find(session[:user_id]).attendances
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
			if @event.errors.full_messages.any?
				flash[:alert] = []
				@event.errors.full_messages.each do |message|
					flash[:alert].push(message)  
				end
			end
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
