class PollsController < ApplicationController
	def index
		@polls = Poll.all
	end

	def new
		@poll = Poll.new
	end

	def create
		@poll = Poll.new(params[:poll])
		if @poll.save
			session[:stats] = @poll.name
			redirect_to edit_poll_path(@poll.edit_slug), :flash => {:success => "Poll sucessfully created! Your unique edit link is #{root_url}#{@poll.edit_slug}"}
		else
			render 'new', :notice => "Your Poll could not be completed."
		end
	end

	def show
		@poll = Poll.find(params[:id])
		@questions = @poll.questions
	end

	def edit
		@poll = Poll.find_by_edit_slug(params[:id])
		@questions =  @poll.questions
	end

	def update
		@poll = Poll.find(params[:id])
		if @poll.update_attributes(params[:poll])
			redirect_to :back, :flash => {:success => "Poll Updated."}
		else
			render :back, :flash => {:error => "Update unsuccessful. Please try again."}
		end
	end

end
