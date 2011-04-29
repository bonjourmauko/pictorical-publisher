class AddWhColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :face_width, :integer
    add_column :users, :face_height, :integer
  end

  def self.down
    remove_column :users, :face_height
    remove_column :users, :face_width
  end
end
