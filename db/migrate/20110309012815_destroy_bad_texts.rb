class DestroyBadTexts < ActiveRecord::Migration
  def self.up
    Text.find(:all).each { |text| text.destroy if text[:author_id] == 2872 }
  end

  def self.down
  end
end
