class UserDiscussionsController < ApplicationController
	def index
		#FIX: current_user id is being passed incorrectly
		@user = User.find(params[:user_id])
		@discussions = @user.discussions
	end

	protected
end
