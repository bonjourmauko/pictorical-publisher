class AddPositionToIllustrations < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :position, :integer
  end

  def self.down
    remove_column :illustrations, :position
  end
end
