class ResponsesController < ApplicationController
  def show
  end

  def edit
  end

  def new
  	@response = Poll.find_by_edit_slug(params[:id]).responses.new
  end

  def create
  	@poll = Poll.find_by_edit_slug(params[:id])
  	@response = .response.new
  	if @response.save
  		redirect_to "/polls/#{@poll.slug}", :success => "Your question has been saved successfully!"
  	else
  		render 'new', :error => "Something went wrong! Try Again."
  	end
  end
end
