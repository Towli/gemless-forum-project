# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  first_name :string
#  last_name  :string
#  email      :string
#  password   :string
#  avatar     :string
#  bio        :text
#

class User < ActiveRecord::Base
end
