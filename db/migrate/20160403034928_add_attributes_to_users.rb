class AddAttributesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :email, :string
  	add_column :users, :password, :string
  	add_column :users, :avatar, :string
  	add_column :users, :bio, :text
  end
end
