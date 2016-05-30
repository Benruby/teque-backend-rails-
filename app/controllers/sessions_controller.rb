class SessionsController <  Devise::SessionsController

	before_filter :authenticate_user_from_token!, except: [:create]
	skip_before_filter :verify_signed_out_user, only: :destroy

	def create
		user = User.find_for_database_authentication(email: params[:email])
		if !user
			render json: {error: "כתובת אימייל לא קיימת"}, status: 401
		else

			if user && user.valid_password?(params[:password])
				token = user.ensure_authentication_token
				render json: user, root: false 
			else
				render json: {error: "שגיאה בסיסמה, נסה שנית או הרשם"}, status: 401
			end
		end
	end

	def destroy
		current_user.authentication_token = nil
		current_user.save!
		render json: {}
	end

	def check_token
		request_token = request.headers['token']
		user = User.find_by_authentication_token(request_token)
		if user
			response_token = user.authentication_token
		end
		render json: {token: response_token}
	end
end