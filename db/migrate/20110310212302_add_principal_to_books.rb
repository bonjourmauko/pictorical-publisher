class AddPrincipalToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :principal_text_id, :integer
  end

  def self.down
    remove_column :books, :principal_text_id
  end
end
