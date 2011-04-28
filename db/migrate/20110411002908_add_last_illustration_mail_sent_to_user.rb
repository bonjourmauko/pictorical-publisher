class AddLastIllustrationMailSentToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :last_illustration_mail_sent_at, :datetime
  end

  def self.down
    remove_column :users, :last_illustration_mail_sent_at
  end
end
