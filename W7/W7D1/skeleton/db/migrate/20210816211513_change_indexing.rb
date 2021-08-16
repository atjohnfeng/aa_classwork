class ChangeIndexing < ActiveRecord::Migration[5.2]
  def change
    remove_index :users, :user_name
    remove_index :users, :session_token
    add_index :users, :user_name, unique: true
    add_index :users, :session_token, unique: true
  end
end
