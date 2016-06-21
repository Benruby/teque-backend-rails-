class QuestionComment < ActiveRecord::Base
	validates :comment_body, presence: true
end
