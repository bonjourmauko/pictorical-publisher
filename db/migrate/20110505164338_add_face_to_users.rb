class AddFaceToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :face_file_name,    :string
    add_column :users, :face_content_type, :string
    add_column :users, :face_file_size,    :integer
    add_column :users, :face_file_extension, :string
    add_column :users, :face_original_id, :string
    add_column :users, :face_updated_at,   :datetime
  end

  def self.down
    remove_column :users, :face_file_name
    remove_column :users, :face_content_type
    remove_column :users, :face_file_size
    remove_column :users, :face_updated_at
    remove_column :users, :face_original_id
    remove_column :users, :face_file_extension
  end
end