class AddDeletedToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :deleted, :boolean
  end

  def self.down
    remove_column :texts, :deleted
  end
end
