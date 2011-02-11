class AddColumnToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :first_name, :string
    add_column :artists, :last_name, :string
    add_column :artists, :country, :string
    add_column :artists, :artistic_name, :string
    add_column :artists, :face_picture_url, :string
    add_column :artists, :handshake, :boolean
    add_column :artists, :birthdate, :date
    add_column :artists, :paypal_account, :string
    add_column :artists, :address_line_one, :string
    add_column :artists, :address_line_two, :string
    add_column :artists, :city, :string
    add_column :artists, :state, :string
    add_column :artists, :zip, :string
    add_column :artists, :art_school_name, :string
    add_column :artists, :art_school_city, :string
    add_column :artists, :art_school_country, :string
    add_column :artists, :portfolio_url, :string
    add_column :artists, :twitter, :string
  end

  def self.down
    remove_column :artists, :twitter
    remove_column :artists, :portfolio_url
    remove_column :artists, :art_school_country
    remove_column :artists, :art_school_city
    remove_column :artists, :art_school_name
    remove_column :artists, :zip
    remove_column :artists, :state
    remove_column :artists, :city
    remove_column :artists, :address_line_two
    remove_column :artists, :address_line_one
    remove_column :artists, :paypal_account
    remove_column :artists, :birthdate
    remove_column :artists, :handshake
    remove_column :artists, :face_picture_url
    remove_column :artists, :artistic_name
    remove_column :artists, :country
    remove_column :artists, :last_name
    remove_column :artists, :first_name
  end
end
