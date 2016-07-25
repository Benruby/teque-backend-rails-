module Api
	class QuestionsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def index
			questions = Question.all.order(created_at: :desc)

			if params[:page]
				questions = questions.page(params[:page]).per(7)
			end

			questions.each do |q|
				q.followed_by_current_user(current_user.id)
				q.add_followers_count
			end

			render json: questions, root: false, each_serializer: AllQuestionsSerializer
		end

		def create
			question = current_user.questions.new(questions_params)
			if question.save
				question.notify_followers(current_user)
			end
			render json: question, status: 201
		end	

		def show
			@question = Question.find_by! id:  params[:id]
			render json: @question, root: false, serializer: QuestionSerializer	
		end

		def user_questions
			@questions = current_user.questions
			render json: @questions, root: false
		end


		private

		def questions_params
			params.require(:question).permit(:title, :body)
		end
	end
end