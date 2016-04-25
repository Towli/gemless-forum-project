class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Account created successfully."
			redirect_to @user
		else
			flash[:error] = "There was a problem creating your account. Please try again."
			render 'new'
		end
	end
	def index
		@users = User.all
	end
	def show
		@user = User.find_by(id: params[:id])
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Profile updated successfully."
			redirect_to @user
		else
			flash[:error] = "There was a problem updating your profile. Please try again."
			render 'edit'
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :first_name, :last_name, :bio)
	end
end
