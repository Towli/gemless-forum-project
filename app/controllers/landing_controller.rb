class LandingController < ApplicationController
	def home
		@discussions = Discussion.all.reverse_order
		if current_user.nil?
			render 'unauthenticated.html.erb'
		else
			render 'authenticated.html.erb'
		end
	end
end
