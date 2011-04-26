class AddTranslatorToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :translation_published, :integer
    add_column :texts, :translation_renewal, :integer
  end

  def self.down
    remove_column :texts, :translation_renewal
    remove_column :texts, :translation_published
  end
end
