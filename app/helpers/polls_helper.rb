module PollsHelper
	def generate_route_for_question
		if @next_question
			link_to "Next Question", question_path(@next_question)
		else
			link_to "Complete Poll", poll_path(@question.poll_id)
		end
	end

	def response_count(responable)
		responable.responses.count
	end

	def response_percentage(answer,question)
		((response_count(answer) /response_count(question).to_f)*100).round(2)
	end

	def poll_completed?
		session[:stats] == @poll.name	
	end

end
