class RenameIllustrationColumnsAgain < ActiveRecord::Migration
  def self.up
    rename_column :illustrations, :inline_file_name,        :image_file_name
    rename_column :illustrations, :inline_content_type,     :image_content_type
    rename_column :illustrations, :inline_file_size,        :image_file_size
    rename_column :illustrations, :inline_updated_at,       :image_updated_at
    rename_column :illustrations, :inline_original_id,      :image_original_id
    rename_column :illustrations, :inline_position,         :position
    rename_column :illustrations, :inline_original_width,   :width
    rename_column :illustrations, :inline_original_height,  :height
    rename_column :illustrations, :inline_file_extension,   :image_file_extension
  end

  def self.down
  end
end
