class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :subject
      t.integer :replies
      t.string :discussion_starter

      t.timestamps null: false
    end
  end
end
