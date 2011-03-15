class DeviseCreateArtists < ActiveRecord::Migration
  def self.up

    #drop_table :artists

    create_table(:artists) do |t|
      t.database_authenticatable :null => false
      t.timestamps
    end

    add_index :artists, :email,                :unique => true
    #add_index :artists, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :artists
  end
end
