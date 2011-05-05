class SetPublishedAndRenewalToAndersonStories < ActiveRecord::Migration
  def self.up
    say_with_time("Asign published time to Andersen's and Grimm's texts") do
      Text.where(:author_id => 48).each do |text|
        text[:published]  = 1933
        text[:renewal]    = 1960
        text.save
      end
    end
  end

  def self.down
  end
end
