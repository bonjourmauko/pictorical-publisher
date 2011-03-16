class Opps < ActiveRecord::Migration
  def self.up
    say_with_time("Fixing a bad parsed chunck of texts") do
      Text.find(:all).each { |text| text.destroy if text[:user_id] == 2872 }
    end
  end

  def self.down
  end
end
