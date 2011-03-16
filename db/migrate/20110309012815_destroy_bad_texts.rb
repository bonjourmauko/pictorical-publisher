class DestroyBadTexts < ActiveRecord::Migration
  def self.up
    say_with_time("Destroying bad texts") do
      Text.find(:all).each { |text| text.destroy if text[:author_id] == 2872 }
    end
  end

  def self.down
  end
end
