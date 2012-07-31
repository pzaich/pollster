class PollsController < ApplicationController
	def index
	end

	def new
		@poll = Poll.new
	end

	def create
		@poll = Poll.new(params[:poll])
		if @poll.save
			redirect_to poll_path(@poll), :flash => {:success => "Poll sucessfully created! Your unique edit link is #{root_url}#{@poll.edit_slug}"}
		else
			render 'new', :notice => "Your Poll could not be completed."
		end
	end

	def show
		@poll = Poll.find(params[:id])
		@questions = Question.where(:poll_id => @poll)
	end

	def edit
		@poll = Poll.find_by_edit_slug(params[:id])
		@questions =  Question.where(:poll_id => @poll)
	end

	def update
		@poll = Poll.find_by_slug(params[:id])
		if @poll.update_attributes(params[:poll])
			redirect_to :back, :flash => {:success => "Poll Updated."}
		else
			render :back, :flash => {:error => "Update unsuccessful. Please try again."}
		end
	end

end
