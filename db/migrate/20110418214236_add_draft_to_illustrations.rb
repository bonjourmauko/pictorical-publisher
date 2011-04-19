class AddDraftToIllustrations < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :draft, :boolean
  end

  def self.down
    remove_column :illustrations, :draft
  end
end
