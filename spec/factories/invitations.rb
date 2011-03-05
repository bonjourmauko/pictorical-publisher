# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :invitation do |f|
  f.first_name "MyString"
  f.last_name "MyString"
  f.email "MyString"
  f.email_sent_on "2011-03-04 21:22:57"
  f.artist_accesed_on "2011-03-04 21:22:57"
end
