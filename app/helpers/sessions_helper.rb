module SessionsHelper

	def current_user
	  if (user_id == session[:user_id]) #here
	    @current_user ||= User.find_by(id: user_id)
	  elsif (user_id == cookies.signed[:user_id]) #and here
	    user = User.find_by(id: user_id)
	    if user && user.authenticated?(:remember, cookies[:remember_token])
	      log_in user
	      @current_user = user
	    end
	  end
	end

	def logged_in?
    !current_user.nil?
	end

end
