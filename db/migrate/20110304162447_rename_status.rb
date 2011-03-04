class RenameStatus < ActiveRecord::Migration
  def self.up
    rename_column :users, :status, :tutorial_mode
  end

  def self.down
    rename_column :users, :tutorial_mode, :status
  end
end
