class AddTranslatorIdToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :translator_id, :integer
    add_index  :texts, :translator_id
  end

  def self.down
    remove_column :texts, :translator_id
  end
end
