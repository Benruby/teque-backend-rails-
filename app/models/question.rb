class Question < ActiveRecord::Base

	attr_accessor :current_user_following 
	attr_accessor :follower_count

	validates :title, length: { minimum: 5 }, presence: true
	validates :title, length: { maximum: 150 }
	validates :body, length: { maximum: 250 }

	belongs_to :user
	has_many :answers
	has_many :question_upvotes
	has_many :question_comments
	has_many :reports, as: :reportable
	has_many :item_comments, as: :commentable
	has_many :followers, as: :followable


	def upvote
		self.upvotes += 1
		self.save!
	end

	def downvote
		self.upvotes -= 1
		self.save!
	end

	def followed_by_current_user(id)
		if Follower.where(user_id: id, followable: self).empty?
			self.current_user_following = false;
		else
			self.current_user_following = true;
		end
	end

	def add_followers_count
		self.follower_count = self.followers.count
	end

end
