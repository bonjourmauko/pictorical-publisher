class AddColumnToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :handshake, :boolean
  end

  def self.down
    remove_column :artists, :handshake
  end
end
