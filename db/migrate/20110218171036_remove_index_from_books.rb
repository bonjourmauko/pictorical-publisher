class RemoveIndexFromBooks < ActiveRecord::Migration
  def self.up
    remove_index :books, :artist_id
  end

  def self.down
    add_index :books, :artist_id, :integer
  end
end
