class Follower < ActiveRecord::Base
	belongs_to :followable, polymorphic: true


	def self.get_followable(params)
		
		case params["followable_type"]
		when "question"
			return Question.find(params["item_id"])
		when "user"
			return User.find(params["item_id"])
		else
			return "no valid type"
		end

	end
end
