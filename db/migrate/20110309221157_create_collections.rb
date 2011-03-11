class CreateCollections < ActiveRecord::Migration
  def self.up
    create_table :collections do |t|
      t.integer :text_id
      t.integer :book_id

      t.timestamps
    end
  end

  def self.down
    drop_table :collections
  end
end
