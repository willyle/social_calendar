class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end
	def show
		@group = Group.find(params[:id])
	end
	def new
		@group = Group.new
	end
	def create
		@group = Group.new(group_params)

		if @group.save
			flash[:notice] = "You have successfully added a group."
			redirect_to '/groups'
		else
			flash[:alert] = "An error has occurred. Please try again."
			redirect_to :back
		end
	end

	private
		def group_params
			params.require(:group).permit(:title, :description)
		end
end
