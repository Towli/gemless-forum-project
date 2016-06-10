# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  title          :string
#  content        :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  discussion_id  :integer
#  user_id        :integer
#  parent_post_id :integer
#  reply_id       :integer
#

class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :discussion

	#Self Joins
	belongs_to :parent_post, class_name: "Post"	
	has_many :replies, class_name: "Post", foreign_key: "parent_post_id"

	before_save do
		self.discussion.increment!(:replies, by = 1)
	end

end
