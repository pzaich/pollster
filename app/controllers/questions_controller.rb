class QuestionsController < ApplicationController
	def show
  end

  def edit
  end

  def new
  	@poll = Poll.find_by_slug(params[:poll_id])
  	@question = @poll.questions.new
  end

  def create
  	@poll = Poll.find_by_slug(params[:poll_id])
  	@question = @poll.questions.new(params[:question])
  	if @question.save
  		redirect_to poll_path(@poll), :flash => {:success => "Your question has been saved successfully!"}
  	else
  		render 'new', :flash => {:error => "Something went wrong! Try Again."}
  	end
  end
end
