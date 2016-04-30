module UsersHelper
	# TODO
	# if user logged in show Logout action
	# else show Login action
	def navbar_display_correct_user_actions
	end

	def profile_owner? user
		current_user == user
	end

end