# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  title         :string
#  content       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  discussion_id :integer
#  user_id       :integer
#

class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :discussion

	after_save do
		self.discussion.increment! :replies, 1
	end

end
