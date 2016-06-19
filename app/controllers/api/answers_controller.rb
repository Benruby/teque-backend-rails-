module Api
	class AnswersController < ApplicationController

		before_filter :authenticate_user_from_token!

		def create
			current_user.answers.create(answer_params)
			render nothing: true,  status: 201
		end	

		private

		def answer_params
			params.require(:answer).permit(:answer_body, :question_id)
		end
	end
end