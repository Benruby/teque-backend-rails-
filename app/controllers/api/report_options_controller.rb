module Api
	class ReportOptionsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def index
			options = ReportOption.all
			render json: options, root: false
		end
	end
end