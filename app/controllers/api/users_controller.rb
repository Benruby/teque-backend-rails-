module Api

	class UsersController < Devise::RegistrationsController

		before_filter :authenticate_user_from_token!, except: :create
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
			user = current_user
			render json: user, root: false
		end

		def update
			user = current_user
			user.update(user_params)
			render json: user, root: false		
		end

		private

		def user_params
			params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :description)
		end
	end

end