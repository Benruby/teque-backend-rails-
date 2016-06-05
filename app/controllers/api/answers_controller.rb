module Api
	class AnswersController < ApplicationController

		before_filter :authenticate_user_from_token!

		def index
			if current_user
				@answers = Answer.where(answer_params[:question_id])
				render json: @answer, root: false
			end
		end

		def create
			if current_user
				current_user.answers.create(answer_params)
				render nothing: true
			else
				render json: {}, status: 401
			end
		end	

		private

		def answer_params
			params.require(:answer).permit(:answer_body, :question_id)
		end
	end
end