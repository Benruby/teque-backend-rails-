module Api
	class NotificationsController < ApplicationController

		before_filter :authenticate_user_from_token!

		def index
			notificaions = Notification.where(user_id: current_user.id).where(seen: false)
			render json: notificaions, root: false
		end

		def update
			notification = Notification.find_by_id(notification_params[:id])
			# binding.pry
			notification.seen = true

			notification.save
			render nothing: true
		end

		private

		def notification_params
			params.require(:notification).permit(:id)
		end
	end
end