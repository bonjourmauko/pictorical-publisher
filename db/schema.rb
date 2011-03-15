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

ActiveRecord::Schema.define(:version => 20110315235028) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "text_id"
    t.integer  "user_id"
    t.string   "status"
    t.integer  "principal_text_id"
  end

  add_index "books", ["principal_text_id"], :name => "index_books_on_principal_text_id"
  add_index "books", ["text_id"], :name => "index_books_on_text_id"
  add_index "books", ["user_id"], :name => "index_books_on_user_id"

  create_table "collections", :force => true do |t|
    t.integer  "text_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collections", ["book_id"], :name => "index_collections_on_book_id"
  add_index "collections", ["text_id"], :name => "index_collections_on_text_id"

  create_table "illustrations", :force => true do |t|
    t.string   "fullsize_url"
    t.string   "thumbnail_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
  end

  add_index "illustrations", ["book_id"], :name => "index_illustrations_on_book_id"

  create_table "invitations", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "email_sent_on"
    t.datetime "artist_accesed_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "specially"
    t.string   "secret"
    t.datetime "redeemed_at"
  end

  create_table "texts", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.string   "source"
    t.integer  "author_id"
    t.integer  "words"
    t.boolean  "deleted"
    t.boolean  "availability"
  end

  add_index "texts", ["author_id"], :name => "index_texts_on_author_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                     :default => "", :null => false
    t.string   "encrypted_password",         :limit => 128, :default => "", :null => false
    t.string   "password_salt",                             :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.string   "artistic_name"
    t.string   "face_picture_url"
    t.boolean  "terms_of_service"
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
    t.boolean  "tutorial_mode"
    t.boolean  "admin"
    t.boolean  "accepted_license_agreement"
    t.string   "art_school_where"
    t.string   "art_school_when"
    t.string   "reset_password_token"
  end

  add_index "users", ["email"], :name => "index_artists_on_email", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
