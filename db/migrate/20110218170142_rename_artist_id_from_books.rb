class RenameArtistIdFromBooks < ActiveRecord::Migration
  def self.up
    rename_column :books, :artist_id, :user_id
    add_index :books, :user_id
  end

  def self.down
    rename_column :books, :user_id, :artist_id
    add_index :books, :artist_id
  end
end
