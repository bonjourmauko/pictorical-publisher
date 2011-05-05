class ChangeForceFromTexts < ActiveRecord::Migration
  def self.up
    rename_column :texts, :force_public_domain, :public_domain_anyway
    rename_column :texts, :force_public_domain_comment, :public_domain_anyway_comment
  end

  def self.down
    rename_column :texts, :public_domain_anyway_comment, :force_public_domain_comment
    rename_column :texts, :public_domain_anyway, :force_public_domain
  end
end
