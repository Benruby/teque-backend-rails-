module Api
	class ReportsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def create

			id = current_user.id
			reason = report_params[:reason]
			reportable = Report.get_reportable(report_params)
			report = Report.create(reportable: reportable,  user_id: id,  reason: reason)

			render json: report

		end

		private

		def report_params
			params.require(:report).permit(:reportable_type, :reportable_id, :reason)
		end

	end
end