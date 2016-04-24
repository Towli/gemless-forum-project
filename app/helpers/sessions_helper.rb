module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def current_user
		unless session[:user_id].nil?
			if @current_user.nil?
				@current_user = User.find(session[:user_id])
			else
				@current_user
			end
		end
	end

	def logged_in?
		!current_user.nil?
	end

end
