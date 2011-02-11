class RemoveColumnFromTexts < ActiveRecord::Migration
  def self.up
    remove_column :texts, :content
  end

  def self.down
    add_column :texts, :content, :string
  end
end
