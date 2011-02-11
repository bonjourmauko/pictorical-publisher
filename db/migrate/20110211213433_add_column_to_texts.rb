class AddColumnToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :content, :text
  end

  def self.down
    remove_column :texts, :content
  end
end
