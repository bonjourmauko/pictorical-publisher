class Opps < ActiveRecord::Migration
  def self.up
    Text.find(:all).each { |text| text.destroy if text[:user_id] == 2872 }
  end

  def self.down
  end
end
