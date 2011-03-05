class AddSecretToInvitations < ActiveRecord::Migration
  def self.up
    add_column :invitations, :secret, :string
  end

  def self.down
    remove_column :invitations, :secret
  end
end
