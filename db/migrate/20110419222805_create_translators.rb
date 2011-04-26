class CreateTranslators < ActiveRecord::Migration
  def self.up
    create_table :translators do |t|
      t.string :name
      t.string :last_name
      t.string :country
      t.integer :defunction

      t.timestamps
    end
  end

  def self.down
    drop_table :translators
  end
end
