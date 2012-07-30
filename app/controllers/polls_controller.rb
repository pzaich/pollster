class PollsController < ApplicationController
	def index
	end

	def new
		@poll = Poll.new
	end

	def create
		@poll = Poll.new(params[:poll])
		if @poll.save
			redirect_to poll_path(@poll)
		else
			render 'new', :notice => "Your Poll could not be completed."
		end
	end

	def show
	end

end
