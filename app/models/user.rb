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

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true, length: { maximum: 40 }
	validates :password, presence: true, length: { minimum: 6 }

	has_many :discussions
	has_many :posts

	def full_name
		self.first_name + " " + self.last_name
	end

	private

end
