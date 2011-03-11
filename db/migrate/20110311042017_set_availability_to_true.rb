class SetAvailabilityToTrue < ActiveRecord::Migration
  def self.up
    Text.all.each { |text| text[:availability] = true }
  end

  def self.down
  end
end
