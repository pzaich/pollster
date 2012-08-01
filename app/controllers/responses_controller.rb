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
    ids = params[:response].merge(:question_id => params[:question_id])
  	@response = Response.new(ids)
    if @response.save
      redirect_to poll_path(@question.poll)
    else
      render poll_path(@question.poll)
    end
  end
end
