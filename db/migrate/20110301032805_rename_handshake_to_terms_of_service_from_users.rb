class RenameHandshakeToTermsOfServiceFromUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :handshake, :terms_of_service
  end

  def self.down
    rename_column :users, :terms_of_service, :handshake
  end
end
