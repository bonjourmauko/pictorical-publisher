class AddColumnsToTexts < ActiveRecord::Migration
  def self.up
    add_column :texts, :force_public_domain, :boolean
    add_column :texts, :force_public_domain_comment, :text
  end

  def self.down
    remove_column :texts, :force_public_domain_comment
    remove_column :texts, :force_public_domain
  end
end
