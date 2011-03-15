class RemoveColumFromTexts < ActiveRecord::Migration
  def self.up
    remove_column :texts, :available

  end

  def self.down
    add_column :texts, :available, :boolean

  end
end
