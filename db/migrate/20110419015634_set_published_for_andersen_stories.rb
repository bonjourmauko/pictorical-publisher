class SetPublishedForAndersenStories < ActiveRecord::Migration
  def self.up
    say_with_time("Asign published time to Andersen's and Grimm's texts") do
      Text.where(:author_id => 4).each do |text|
        text[:published] = 0
        text.save
      end

      Text.where(:author_id => 1).each do |text|
        text[:published] = 0
        text.save
      end
      
      Text.where(:author_id => 3).each do |text|
        text[:published] = 0
        text.save
      end      
      
    end
  end

  def self.down
  end
end
