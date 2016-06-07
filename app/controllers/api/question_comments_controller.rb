module Api
	class QuestionCommentsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def index
			comments = QuestionComment.where(question_id: params[:question_id])
			render json: comments, root: false
		end

		def create
			if current_user
				current_user.question_comments.create(comment_params)
				render nothing: true
			else
				render json: {message: "error"}
			end
		end


		# def destroy
		# 	if current_user
		# 		current_user.question_upvotes.where(question_id: params[:id]).destroy_all
		# 		question = Question.find_by! id: params[:id]
		# 		question.downvote
		# 		render json: question
		# 	else
		# 		render json: {message: "error"}
		# 	end	

		# end
		private

		def comment_params
			params.require(:question_comment).permit(:comment_body, :question_id)
		end

	end
end