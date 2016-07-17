module Api
	class ItemCommentsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def create

			id = current_user.id
			body = comment_params[:body]
			commentable = ItemComment.get_commentable(comment_params)
			comment = ItemComment.create(commentable: commentable,  user_id: id,  body: body)

			render json: comment, root: false

		end

		private

		def comment_params
			params.require(:item_comment).permit(:body, :commentable_type, :item_id)
		end

	end
end