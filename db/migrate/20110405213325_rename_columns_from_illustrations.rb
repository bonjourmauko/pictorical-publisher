class RenameColumnsFromIllustrations < ActiveRecord::Migration
  def self.up
    rename_column :illustrations, :illustration_file_name,      :story_file_name
    rename_column :illustrations, :illustration_content_type,   :story_content_type
    rename_column :illustrations, :illustration_file_size,      :story_file_size
    rename_column :illustrations, :illustration_updated_at,     :story_updated_at
    rename_column :illustrations, :illustration_unique_prefix,  :story_original_id
    rename_column :illustrations, :position,                    :story_position
    add_column    :illustrations, :story_original_width,        :integer
    add_column    :illustrations, :story_original_height,       :integer
  end

  def self.down
  end
end
