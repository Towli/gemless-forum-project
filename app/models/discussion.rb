# == Schema Information
#
# Table name: discussions
#
#  id                 :integer          not null, primary key
#  subject            :string
#  replies            :integer
#  discussion_starter :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  content            :text
#  user_id            :integer
#

class Discussion < ActiveRecord::Base
	belongs_to :user
	has_many :posts
end
