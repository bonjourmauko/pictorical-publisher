class AddInlineFileExtensionToIllustrations < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :inline_file_extension, :string
  end

  def self.down
    remove_column :illustrations, :inline_file_extension
  end
end
