require 'spec_helper'

describe Response do
	before :each do
		question = Question.new(:title => "what is your favorite color?")
		@answer = question.answers.new(:value => "blue")
		@response = Response.new(:answer_id => @answer.id, :question_id => question.id)
	end

	subject { @response }

	it {should respond_to(:answer)}
	it {should respond_to(:question)}

	
end