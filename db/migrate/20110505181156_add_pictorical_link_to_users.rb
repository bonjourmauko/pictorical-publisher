class AddPictoricalLinkToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :pictorical_link, :string
  end

  def self.down
    remove_column :users, :pictorical_link
  end
end
