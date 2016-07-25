class Answer < ActiveRecord::Base

	belongs_to :user
	belongs_to :question
	has_many :reports, as: :reportable
	has_many :item_comments, as: :commentable

	def notify_followers(user)
		followers = Follower.where(followable: user) + Follower.where(followable_type: 'question', followable_id: self.id)
		if followers.empty?
		else
			followers.each do |f| 
				Notification.create(notifiable: self, user_id: f.user_id)
			end
		end
	end
end
