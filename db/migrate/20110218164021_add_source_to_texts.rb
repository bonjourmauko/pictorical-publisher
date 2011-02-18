class AddSourceToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :source, :string
  end

  def self.down
    remove_column :texts, :source
  end
end
