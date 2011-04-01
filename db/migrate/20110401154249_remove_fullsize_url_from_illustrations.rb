class RemoveFullsizeUrlFromIllustrations < ActiveRecord::Migration
  def self.up
    remove_column :illustrations, :fullsize_url
    remove_column :illustrations, :thumbnail_url
  end

  def self.down
    add_column :illustrations, :fullsize_url, :string
    add_column :illustrations, :thumbnail_url, :string
  end
end
