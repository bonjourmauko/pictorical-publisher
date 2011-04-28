class AddTypeToIllustrations < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :type, :string
  end

  def self.down
    remove_column :illustrations, :type
  end
end
