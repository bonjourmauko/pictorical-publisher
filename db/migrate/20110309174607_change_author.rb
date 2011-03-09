class ChangeAuthor < ActiveRecord::Migration
  def self.up
    Text.where(:id => 370) { |text| text[:author_id] = 20 if !text.first.nil? }
  end

  def self.down
  end
end
