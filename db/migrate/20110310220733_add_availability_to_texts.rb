class AddAvailabilityToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :availability, :boolean
  end

  def self.down
    remove_column :texts, :availability
  end
end
