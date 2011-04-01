class DropIllustrations < ActiveRecord::Migration
  def self.up
  drop_table :illustrations
  end

  def self.down
  end
end
