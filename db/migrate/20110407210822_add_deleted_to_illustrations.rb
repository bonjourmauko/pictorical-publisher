class AddDeletedToIllustrations < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :deleted, :boolean
  end

  def self.down
    remove_column :illustrations, :deleted
  end
end
