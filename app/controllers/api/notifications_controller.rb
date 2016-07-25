module Api
	class NotificationsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def index
			notificaions = Notification.where(user_id: current_user.id).where(seen: false)
			render json: notificaions, root: false
		end

		def update
			
		end
	end
end