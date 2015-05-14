class AddUserToComments < ActiveRecord::Migration
  def change
    add_column :comments, :user_id, :conferences
  end
end
