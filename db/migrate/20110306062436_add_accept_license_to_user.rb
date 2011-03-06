class AddAcceptLicenseToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :accepted_license_agreement, :boolean
  end

  def self.down
    remove_column :users, :accepted_license_agreement
  end
end
