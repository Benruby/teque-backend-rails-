class Question < ActiveRecord::Base

	validates :title, length: { minimum: 5 }
	validates :title, length: { maximum: 150 }
	validates :body, length: { minimum: 5 }
	validates :body, length: { maximum: 250 }

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
