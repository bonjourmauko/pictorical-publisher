class AddSpeciallyToInvitation < ActiveRecord::Migration
  def self.up
    add_column :invitations, :specially, :text
  end

  def self.down
    remove_column :invitations, :specially
  end
end
