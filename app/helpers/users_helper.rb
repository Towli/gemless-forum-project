module UsersHelper
	# TODO
	# if user logged in show Logout action
	# else show Login action
	def navbar_display_correct_user_actions
	end

	# These methods are not intuitive because of the parameters passed in.
	def profile_owner? user
		current_user == user
	end

	def post_owner? user
		current_user == user
	end

	def discussion_owner? user
		current_user == user
	end
	######################################################################

	def amount_of_discussions_created user
		user.discussions.count
	end

	# Currently, just looks for the discussion with the largest
	# amount of replies
	def starred_discussion user
		user.discussions.order('replies DESC').first
	end

end