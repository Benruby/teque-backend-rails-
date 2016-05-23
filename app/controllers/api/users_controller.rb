module Api

	class UsersController < Devise::RegistrationsController

		def create
			@user = User.new user_params

			if @user.save
				render json: @user, root: nil
				UserMailer.signup_confirmation(@user).deliver_now
			else
				render json: { errors:@user.errors }, status: :unprocessable_entity
			end
		end

		private

		def user_params
			params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
		end
	end

end