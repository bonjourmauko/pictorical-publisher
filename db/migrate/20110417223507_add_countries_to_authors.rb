class AddCountriesToAuthors < ActiveRecord::Migration
  def self.up
    add_column :authors, :country, :string
    add_column :authors, :defunction, :integer
  end

  def self.down
    remove_column :authors, :defunction
    remove_column :authors, :country
  end
end
