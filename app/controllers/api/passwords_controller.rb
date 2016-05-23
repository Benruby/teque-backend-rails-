module Api
	class PasswordsController < ApplicationController

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
		# def update
		# 	@user = User.find_by_reset_password_token!(params[:user][:reset_password_token])
		# 	if @user.reset_password_sent_at < 2.hours.ago
		# 		flash[:error] = "פג תוקף הלינק לחידוש סיסמה. אנא בקש חדש"
		# 		redirect_to :back
		# 	elsif
		# 		@user.update_attributes(update_password)
		# 		flash[:success] = "הסיסמה עודכנה בהצלחה."
		# 		@user.send_success_password
		# 		render :edit
		# 	else
		# 		flash[:error] = "סיסמאות לא זהות, נסה שנית"
		# 		redirect_to :back
		# 	end
		# end
		private

		def update_password
			params.require(:user).permit(:password, :password_confirmation)
		end
	end
end