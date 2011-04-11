class AddWidthAndHeightToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :width, :integer
    add_column :users, :height, :integer
  end

  def self.down
    remove_column :users, :height
    remove_column :users, :width
  end
end
