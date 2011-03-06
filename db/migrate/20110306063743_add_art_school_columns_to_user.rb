class AddArtSchoolColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :art_school_where, :string
    add_column :users, :art_school_when, :string
  end

  def self.down
    remove_column :users, :art_school_when
    remove_column :users, :art_school_where
  end
end
