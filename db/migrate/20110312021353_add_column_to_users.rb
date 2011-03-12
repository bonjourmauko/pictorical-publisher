class AddColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :reset_password_token, :string
    add_index :users, :reset_password_token, :unique => true
  end

  def self.down
    remove_column :users, :reset_password_token
  end
end
