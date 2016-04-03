module PostsHelper
	def created_at_humanized(time)
		return time_ago_in_words(time) + " ago"
	end
end
