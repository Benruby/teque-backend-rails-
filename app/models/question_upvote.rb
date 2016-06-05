class QuestionUpvote < ActiveRecord::Base

	belongs_to :user
	belongs_to :question


	# def update_question_id(id)
	# 	self.question_id = id
	# 	self.save!
	# end
end
