module PollsHelper
	def generate_route_for_question
		if @next_question
			link_to "Next Question", question_path(@next_question)
		else
			link_to "Complete Poll", poll_path(@question.poll_id)
		end
	end
end
