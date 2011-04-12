class RemoveTypeFromIllustration < ActiveRecord::Migration
  def self.up
    remove_column :illustrations, :type
  end

  def self.down
    add_column :illustrations, :type, :string
  end
end
