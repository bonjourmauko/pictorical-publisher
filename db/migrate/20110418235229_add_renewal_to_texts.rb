class AddRenewalToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :renewal, :integer
  end

  def self.down
    remove_column :texts, :renewal
  end
end
