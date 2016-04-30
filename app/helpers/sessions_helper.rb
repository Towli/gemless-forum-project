module SessionsHelper

	def log_in(user)
		session[:current_user_id] = user.id
	end

	def log_out
		session.delete(:current_user_id)
		@current_user = nil
	end

	#TODO: make this method smaller
	def current_user
		unless session[:current_user_id].nil?
			if @current_user.nil?
				@current_user = User.find(session[:current_user_id])
			else
				@current_user
			end
		end
	end

	def logged_in?
		!current_user.nil?
	end

end
