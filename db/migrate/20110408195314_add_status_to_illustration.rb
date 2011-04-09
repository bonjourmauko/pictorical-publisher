class AddStatusToIllustration < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :status, :string
  end

  def self.down
    remove_column :illustrations, :status
  end
end
