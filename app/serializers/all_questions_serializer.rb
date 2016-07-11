class AllQuestionsSerializer < ActiveModel::Serializer
	attributes :id, :title, :body, :user_id, :upvotes

	has_many :question_upvotes
	has_many :answers
	has_many :reports, as: :reportable
end
