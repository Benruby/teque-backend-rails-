module Api
	class AnswersController < ApplicationController

		before_filter :authenticate_user_from_token!

		def create
			answer = current_user.answers.new(answer_params)
			if answer.save
				answer.notify_followers(current_user)
			end
			render nothing: true,  status: 201
		end	

		private

		def answer_params
			params.require(:answer).permit(:answer_body, :question_id)
		end
	end
end