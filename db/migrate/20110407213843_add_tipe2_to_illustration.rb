class AddTipe2ToIllustration < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :tipe, :string
  end

  def self.down
    remove_column :illustrations, :tipe
  end
end
