class AddColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :facepic_file_extension, :string
  end

  def self.down
    remove_column :users, :facepic_file_extension
  end
end
