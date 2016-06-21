class QuestionUpvote < ActiveRecord::Base

validates :question_id, presence: true

	belongs_to :user
	belongs_to :question
end
