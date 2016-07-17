class ItemComment < ActiveRecord::Base

	belongs_to :commentable, polymorphic: true
	belongs_to :user
	has_many :item_comments, as: :commentable

	def self.get_commentable(params)

		case params[:commentable_type]
		when "answer"
			return Answer.find(params[:item_id])
		when "question"
			return Question.find(params[:item_id])
		when "comment"
			return ItemComment.find(params[:item_id])
		else
			return "no valid type"
		end

	end
end
