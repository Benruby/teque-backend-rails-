class Question < ActiveRecord::Base

	belongs_to :user
	has_many :answers
	has_many :question_upvotes


	def upvote
		self.upvotes += 1
		self.save!
	end

	def downvote
		self.upvotes -= 1
		self.save!
	end

end
