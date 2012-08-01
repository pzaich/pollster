require 'spec_helper'

describe Answer do
	before :each do
		@question = Question.new(:title => "what's up")
		@answer = Fabricate(:answer)
		@answer.question_id = @question_id
	end

	subject { @answer }

	it {should respond_to(:value)}
	it {should respond_to(:responses)}
	it {should respond_to(:question)}

	describe "it should fail to validate if a value is not specified" do
		before {@answer.value = nil}
		it {should_not be_valid}
	end
end
