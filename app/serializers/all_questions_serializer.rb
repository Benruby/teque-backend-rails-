class AllQuestionsSerializer < ActiveModel::Serializer
	attributes :id, :title, :body, :user_id, :upvotes, :current_user_following, :follower_count

	has_many :question_upvotes
	has_many :answers
	has_many :reports, as: :reportable
	has_many :item_comments, as: :commentable
end
