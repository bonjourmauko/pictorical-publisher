class RenameStatusFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :status
    add_column    :users, :status, :boolean
  end

  def self.down
    remove_column :users, :status
    add_column    :users, :status, :string
  end
end
