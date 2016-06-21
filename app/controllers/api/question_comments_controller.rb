module Api
	class QuestionCommentsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def index
			comments = QuestionComment.where(question_id: params[:question_id])
			render json: comments, root: false
		end

		def create
				current_user.question_comments.create(comment_params)
				render nothing: true
		end

		private

		def comment_params
			params.require(:question_comment).permit(:comment_body, :question_id)
		end

	end
end