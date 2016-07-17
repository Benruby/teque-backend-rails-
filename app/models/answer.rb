class Answer < ActiveRecord::Base

	belongs_to :user
	belongs_to :question
	has_many :reports, as: :reportable
	has_many :item_comments, as: :commentable

end
