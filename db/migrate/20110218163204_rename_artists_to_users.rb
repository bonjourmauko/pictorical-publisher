class RenameArtistsToUsers < ActiveRecord::Migration
  def self.up
    rename_table :artists, :users
  end

  def self.down
    rename_table :users, :artists
  end
end
