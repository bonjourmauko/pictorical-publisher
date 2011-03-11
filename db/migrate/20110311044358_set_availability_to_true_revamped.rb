class SetAvailabilityToTrueRevamped < ActiveRecord::Migration
  def self.up
    Text.all.each { |text| text[:availability] = true if !text.first.nil?; text.save }
  end

  def self.down
  end
end
