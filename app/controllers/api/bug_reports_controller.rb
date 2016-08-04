module Api
	class BugReportsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def create
			bug_report = current_user.bug_reports.new(report_params)
			bug_report.save
			render nothing: true,  status: 200
		end	

		private

		def report_params
			params.require(:bug_report).permit(:body)
		end
	end
end