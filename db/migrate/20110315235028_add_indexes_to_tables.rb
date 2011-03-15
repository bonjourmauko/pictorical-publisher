class AddIndexesToTables < ActiveRecord::Migration
  def self.up
    add_index :collections, :text_id
    add_index :collections, :book_id
    add_index :books, :principal_text_id 
  end

  def self.down
  end
end
