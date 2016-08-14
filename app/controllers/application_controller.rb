class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers
  
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT, DELETE'
    headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With auth_token X-CSRF-Token}.join(',')
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == "OPTIONS"
      headers['Access-Control-Allow-Origin'] = 'http://localhost'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, PUT, DELETE'
      headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With auth_token X-CSRF-Token}.join(',')
      headers['Access-Control-Max-Age'] = '1728000'
      render :text => '', :content_type => 'text/plain'
    end
  end


  def authenticate_user_from_token!
  	token = request.headers["token"].presence
  	user  = token && User.find_by_authentication_token(token.to_s)
  	if user
  		sign_in user, store: false
    else
      return false
    end
  end

  def get_current_user
    authenticate_user_from_token!
    return current_user
  end
end
