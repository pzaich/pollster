require 'spec_helper'

describe Question do
	before :each do 
		@question = Fabricate(:question)
	end

	subject { @question }

	it { should respond_to(:title) }
	it { should respond_to(:poll) }
	it { should respond_to(:responses) }
	it { should respond_to(:answers) }

	describe "when question is not passed a title, it should not validate" do
		before {@question.title = nil}
		it {should_not be_valid}
  end
end

