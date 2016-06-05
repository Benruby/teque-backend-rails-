module Api
	class QuestionUpvotesController < ApplicationController

		before_filter :authenticate_user_from_token!

		def create
			if current_user
				current_user.question_upvotes.create(question_id: params[:question_id])
				question = Question.find_by! id: params[:question_id]
				question.upvote
				render json: question
			else
				render json: {message: "error"}
			end
		end


		def destroy
			if current_user
				current_user.question_upvotes.where(question_id: params[:id]).destroy_all
				question = Question.find_by! id: params[:id]
				question.downvote
				render json: question
			else
				render json: {message: "error"}
			end	

		end


	end
end