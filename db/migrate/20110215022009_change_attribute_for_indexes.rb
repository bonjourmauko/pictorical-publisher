class ChangeAttributeForIndexes < ActiveRecord::Migration
  def self.up

    add_index :illustrations, :book_id
    add_index :books, :text_id
    add_index :books, :artist_id
  end

  def self.down
    remove_index :illustrations, :book_id
    remove_index :books, :text_id
    remove_index :books, :artist_id

    add_column :illustrations, :book_id, :integer
    add_column :books, :text_id, :integer
    add_column :books, :artist_id, :integer
  end
end
