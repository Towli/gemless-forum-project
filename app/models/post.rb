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
#

class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :discussion
end
