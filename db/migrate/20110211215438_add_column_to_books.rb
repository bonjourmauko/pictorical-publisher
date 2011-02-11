class AddColumnToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :text_id, :integer
    add_column :books, :artist_id, :integer
  end

  def self.down
    remove_column :books, :artist_id
    remove_column :books, :text_id
  end
end
