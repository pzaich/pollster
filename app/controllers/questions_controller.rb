class QuestionsController < ApplicationController
	def show
  end

  def edit
  end

  def new
  	@poll = Poll.find(params[:poll_id])
  	@question = @poll.questions.new
  end

  def create
  	@poll = Poll.find(params[:poll_id])
  	@question = @poll.questions.new(params[:question])
  	if @question.save
  		redirect_to edit_poll_path(@poll.edit_slug), :flash => {:success => "Your question has been saved successfully!"}
  	else
  		render 'new', :flash => {:error => "Something went wrong! Try Again."}
  	end
  end

  def edit
  	@poll = Poll.find(params[:poll_id])
  	@question = @poll.questions.find_by_poll_id(@poll.id)
  end

  def update
  	@question = Question.find(params[:id])
		if @question.update_attributes(params[:poll])
			redirect_to edit_poll_path(@question.poll.edit_slug), :flash => {:success => "Question Updated."}
		else
			render :back, :flash => {:error => "Update unsuccessful. Please try again."}
		end
  end
end
