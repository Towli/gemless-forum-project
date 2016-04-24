class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		if current_user = find_user_by_params
			if authenticate_user current_user
				flash[:success] = "Log in successful!"
				log_in current_user
				redirect_to root_path
			else
				flash[:danger] = "Log in failed. Please try again."
				render 'new'
			end
		else
			flash[:danger] = "Log in failed. Please try again."
			render 'new'
		end
	end	
	
	def destroy
		log_out
		redirect_to root_path
	end

	protected

	def session_params
		params.require(:session).permit(:email, :password)
	end

	def find_user_by_params
		User.find_by email: params[:session][:email]
	end

	def authenticate_user(user)
		if params[:session][:password] == user.password
			user
		end
	end

end