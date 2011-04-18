class AddPublishedToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :published, :integer
  end

  def self.down
    remove_column :texts, :published
  end
end
