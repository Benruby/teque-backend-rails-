class SessionsController <  Devise::SessionsController

	before_filter :authenticate_user_from_token!, except: [:create]

	def create
		user = User.find_for_database_authentication(email: params[:email])
		if !user
			render json: {error: "כתובת אימייל לא קיימת"}, status: 401
		else

			if user && user.valid_password?(params[:password])
				token = user.ensure_authentication_token
			render json: { auth_token: token} #this sends to the client side the auth_token & role of user
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
end