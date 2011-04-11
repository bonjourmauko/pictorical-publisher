class AddIllustrationUniquePrefixToIllustrations < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :illustration_unique_prefix, :string
  end

  def self.down
    remove_column :illustrations, :illustration_unique_prefix
  end
end
