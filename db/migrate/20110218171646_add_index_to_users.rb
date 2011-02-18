class AddIndexToUsers < ActiveRecord::Migration
  def self.up
    add_index :users, :email
  end

  def self.down
  end
end
