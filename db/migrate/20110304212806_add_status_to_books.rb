class AddStatusToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :status, :string
  end

  def self.down
    remove_column :books, :status
  end
end
