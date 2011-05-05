class SetPublishedAndRenewalToAndersonStories < ActiveRecord::Migration
  def self.up
    Text.where(:author_id => 48).each do |text|
      text[:published]  = 1933
      text[:renewal]    = 1960
      text.save
    end
  end

  def self.down
  end
end
