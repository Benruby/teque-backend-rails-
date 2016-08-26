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
			current_user = get_current_user
			user.is_followed?(current_user.id)
			render json: user, root: false, serializer: ShowUserSerializer
		end

		def update
			current_user.update(user_params)
			render json: current_user, root: false, serializer: UpdateUserSerializer		
		end

		def check_if_current_user
			requested_user = JSON.parse(params[:user])
			user = User.find(requested_user['id'])
			if current_user.id == user.id
				render nothing:true, status: 401
			else
				render nothing:true, status: 200
			end

		end

		private

		def user_params
			params.require(:user).permit(:full_name, :email, :password, :password_confirmation, :description, :avatar, :id)
		end
	end

end