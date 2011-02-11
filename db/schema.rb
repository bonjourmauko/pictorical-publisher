# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110211215621) do

  create_table "artists", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.string   "password_salt",                     :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.string   "artistic_name"
    t.string   "face_picture_url"
    t.boolean  "handshake"
    t.date     "birthdate"
    t.string   "paypal_account"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "art_school_name"
    t.string   "art_school_city"
    t.string   "art_school_country"
    t.string   "portfolio_url"
    t.string   "twitter"
  end

  add_index "artists", ["email"], :name => "index_artists_on_email", :unique => true

  create_table "books", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "text_id"
    t.integer  "artist_id"
  end

  create_table "illustrations", :force => true do |t|
    t.string   "fullsize_url"
    t.string   "thumbnail_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
  end

  create_table "texts", :force => true do |t|
    t.string   "author"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
  end

end
