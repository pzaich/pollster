class ResponsesController < ApplicationController
  def show
  end

  def edit
  end

  def new
  	@response = Response.new
  end

  def create
    @question = Question.find(params[:question_id])
    @next_question = @question.poll.questions.where("id > ?", params[:question_id]).first
  	@response = Response.new(:question_id => params[:question_id], :answer_id => params[:answer_id])
    if @response.save
      warn "*******************************************"
      warn @next_question
      if @next_question.nil?
        redirect_to poll_path(@question.poll)
      else
        redirect_to question_path(@next_question)
      end
    else
      render question_path(@question), :flash => {:error => "Something went wrong, try again."}
    end
  end
end
