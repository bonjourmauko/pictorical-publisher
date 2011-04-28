class AddProblemsToIllustration < ActiveRecord::Migration
  def self.up
    add_column :illustrations, :problems, :text
  end

  def self.down
    remove_column :illustrations, :problems
  end
end
