module Api

	class UsersController < Devise::RegistrationsController

		before_filter :authenticate_user_from_token!, except: [:create, :show]
		skip_before_filter :authenticate_scope!, only: [:update]

		def create
			@user = User.new user_params

			if @user.save
				token = @user.ensure_authentication_token
				render json: @user, root: nil
				UserMailer.signup_confirmation(@user).deliver_now
			else
				render json: { errors:@user.errors }, status: :unprocessable_entity
			end
		end

		def show
			user = User.find_by_id(params[:id])
			if current_user
				user.is_followed?(current_user.id)
			end
			render json: user, root: false, serializer: ShowUserSerializer
		end

		def update
			current_user.update(user_params)
			render json: current_user, root: false		
		end

		private

		def user_params
			params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :description, :avatar, :id)
		end
	end

end