class AddColumnToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :last_book_no_illustration_reminder_at, :datetime
  end

  def self.down
    remove_column :users, :last_book_no_illustration_reminder_at
  end
end
