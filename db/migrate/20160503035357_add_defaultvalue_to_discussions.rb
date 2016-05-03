class AddDefaultvalueToDiscussions < ActiveRecord::Migration
  def change
  	change_column :discussions, :replies, :integer, default: 0
  end
end
