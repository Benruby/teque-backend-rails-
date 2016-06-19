class Question < ActiveRecord::Base

	validates :title, length: { minimum: 5 }, presence: true
	validates :title, length: { maximum: 150 }
	validates :body, length: { maximum: 250 }

	belongs_to :user
	has_many :answers
	has_many :question_upvotes
	has_many :question_comments


	def upvote
		self.upvotes += 1
		self.save!
	end

	def downvote
		self.upvotes -= 1
		self.save!
	end

end
