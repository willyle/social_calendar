class HomeController < ApplicationController
	def index
		if session[:user_id]
			redirect_to '/events'
		end
	end
end
