class ChangeAuthor < ActiveRecord::Migration
  def self.up
    say_with_time("Changing author to text") do
      Text.where(:id => 370) { |text| text[:author_id] = 20 if text? }
    end
  end

  def self.down
  end
end
