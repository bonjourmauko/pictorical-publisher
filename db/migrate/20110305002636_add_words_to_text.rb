class AddWordsToText < ActiveRecord::Migration
  def self.up
    add_column :texts, :words, :integer
  end

  def self.down
    remove_column :texts, :words
  end
end
