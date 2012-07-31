class AnswersController < ApplicationController

	def new
		@question = Question.find(params[:question_id])
  	@answer = @question.answers.new
	end

	def create
		@question = Question.find(params[:question_id])
  	@answer = @question.answers.new(params[:answer])
  	if @answer.save
  		redirect_to  edit_poll_question_path(@question.poll, @question), :flash => {:success => "Your answer has been saved successfully!"}
  	else
  		render 'new', :flash => {:error => "Something went wrong! Try Again."}
  	end
	end

end
