class SetAvailabilityToTrue < ActiveRecord::Migration
  def self.up
    Text.all { |text| text[:availability] = true if !text.first.nil? }
  end

  def self.down
  end
end
