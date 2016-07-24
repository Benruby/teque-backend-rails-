module Api
	class FollowersController < ApplicationController

		before_filter :authenticate_user_from_token!

		def create

			id = current_user.id
			followable = Follower.get_followable(follow_params)
			follower = Follower.create(followable: followable,  user_id: id)

			render json: follower, root: false
		end

		def destroy
			id = current_user.id
			delete_params = JSON.parse(params[:follow])
			followable = Follower.get_followable(delete_params)
			relationship = Follower.where(user_id: id, followable: followable)
			relationship.destroy_all
			render json: relationship, root: false
		end

		private

		def follow_params
			params.require(:follow).permit(:followable_type, :item_id)
		end

	end
end