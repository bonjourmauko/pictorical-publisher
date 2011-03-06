class AddAvailableToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :available, :boolean
  end

  def self.down
    remove_column :texts, :available
  end
end
