# == Schema Information
#
# Table name: discussions
#
#  id                 :integer          not null, primary key
#  subject            :string
#  replies            :integer          default("0")
#  discussion_starter :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  content            :text
#  user_id            :integer
#

require 'test_helper'

class DiscussionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
