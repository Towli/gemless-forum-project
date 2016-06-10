class AddReplyIdAndParentPostIdToPosts < ActiveRecord::Migration
  def change
  	add_reference :posts, :parent_post, foreign_key: true
  	add_column :posts, :reply_id, :integer
  end
end
