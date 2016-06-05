module Api
	class QuestionsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def index
			if current_user
				@questions = Question.all
				render json: @questions, root: false, each_serializer: AllQuestionsSerializer
			else
				render json: {}, status: 401
			end
		end

		def new
		end

		def create
			if current_user
				current_user.questions.create(questions_params)
				render nothing: true
			else
				render json: {}, status: 401
			end
		end	

		def show
			if current_user
				@question = Question.find_by! id:  params[:id]
				render json: @question, root: false, serializer: QuestionSerializer
			end
		end

		def update
		end

		private

		def questions_params
			params.require(:question).permit(:title, :body)
		end
	end
end