class ResponsesController < ApplicationController

  def new
  	@response = Response.new
  end

  def create
    @question = Question.find(params[:question_id])
    @next_question = @question.poll.questions.where("id > ?", params[:question_id]).first
  	@response = Response.new(:question_id => params[:question_id], :answer_id => params[:answer_id])
    if @response.save
      if @next_question.nil?
        session[:stats] = @question.poll.name 
        redirect_to poll_path(@question.poll), :flash => {:success => "Survey Complete"}
      else
        redirect_to question_path(@next_question)
      end
    else
      redirect_to question_path(@question), :flash => {:error => "Update unsuccessful. Please try again."}
    end
  end
end
