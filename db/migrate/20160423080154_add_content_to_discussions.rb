class AddContentToDiscussions < ActiveRecord::Migration
  def change
  	add_column :discussions, :content, :text
  end
end
