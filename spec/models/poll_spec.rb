require 'spec_helper'

describe Poll do
	before :each do 
		@poll = Fabricate(:poll)
	end

	it { should respond_to(:name) }
	it { should respond_to(:edit_slug) }

	describe "#generate_edit_slug" do
		it "should have a unique edit_slug" do
			poll2 = Fabricate(:poll)
			poll2.edit_slug.should_not eq(@poll.edit_slug)
		end
	end
	
end

