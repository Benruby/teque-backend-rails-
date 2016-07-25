class Report < ActiveRecord::Base

	belongs_to :reportable, polymorphic: true

	def self.get_reportable(params)

		case params[:reportable_type]
		when "answer"
			return Answer.find(params[:reportable_id])
		when "question"
			return Question.find(params[:reportable_id])
		when "comment"
			return ItemComment.find(params[:reportable_id])
		else
			return "no valid type"
		end

	end
end
