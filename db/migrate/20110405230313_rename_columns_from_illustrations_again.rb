class RenameColumnsFromIllustrationsAgain < ActiveRecord::Migration
  def self.up
    rename_column :illustrations, :story_file_name,       :inline_file_name
    rename_column :illustrations, :story_content_type,    :inline_content_type
    rename_column :illustrations, :story_file_size,       :inline_file_size
    rename_column :illustrations, :story_updated_at,      :inline_updated_at
    rename_column :illustrations, :story_original_id,     :inline_original_id
    rename_column :illustrations, :story_position,        :inline_position
    rename_column :illustrations, :story_original_width,  :inline_original_width
    rename_column :illustrations, :story_original_height, :inline_original_height
  end

  def self.down
  end
end
