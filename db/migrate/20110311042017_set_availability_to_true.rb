class SetAvailabilityToTrue < ActiveRecord::Migration
  def self.up
    say_with_time("Asign the availability parameter to all texts") do
      Text.all.each { |text| text[:availability] = true; text.save }
    end
  end

  def self.down
  end
end
