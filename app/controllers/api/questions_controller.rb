module Api
	class QuestionsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def index
				questions = Question.all
				render json: questions, root: false, each_serializer: AllQuestionsSerializer
		end

		def create
				question = current_user.questions.create(questions_params)
				render json: question, status: 201
		end	

		def show
				@question = Question.find_by! id:  params[:id]
				render json: @question, root: false, serializer: QuestionSerializer	
		end


		private

		def questions_params
			params.require(:question).permit(:title, :body)
		end
	end
end