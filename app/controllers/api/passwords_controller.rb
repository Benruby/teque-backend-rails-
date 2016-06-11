module Api
	class PasswordsController < ApplicationController

		before_filter :authenticate_user_from_token!, except: [:update, :create]

		def new
		end

		def create
			user = User.find_by_email(params[:email])
			user.send_password_reset if user
			render nothing: true
		end	

		def edit
			@user = User.find_by_reset_password_token!(params[:id])
		end

		def update
			@user = User.find_by_reset_password_token!(params[:user][:reset_password_token])		
			if @user.reset_password_sent_at <2.hours.ago
				flash[:error] = "פג תוקף הלינק לחידוש סיסמה. אנא בקש חדש"
				redirect_to :edit
			elsif @user.update_attributes(update_password)
				flash[:success] = "הסיסמה עודכנה בהצלחה."
				#redirect to homepgae in the future
				render "successful_password.html.erb"	
			else
				flash[:error] = "סיסמאות לא זהות, נסה שנית"
				render nothing: true
			end
		end

		def password_update
			user = current_user
			user.update_attributes(password_params)
			render json: {message: "password update was successful"}
		end

		def check_password
			user = current_user
			if user.valid_password?(params[:password])
				render json: {message: "valid password"}, status: 200
			else
				render json: {message: "INVALID password"}, status: 403
			end
		end

		private

		def update_password
			params.require(:user).permit(:password, :password_confirmation)
		end

		def password_params
			params.require(:user).permit(:password)
		end
	end
end