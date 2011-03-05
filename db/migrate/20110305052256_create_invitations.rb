class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :email_sent_on
      t.datetime :artist_accesed_on

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
