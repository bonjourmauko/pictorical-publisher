class AddIndexToTexts < ActiveRecord::Migration
  def self.up
    remove_column :texts, :author
    add_column :texts, :author_id, :integer
    add_index :texts, :author_id
  end

  def self.down
    remove_index :texts, :author_id
    add_column :texts, :author, :string
  end
end
