class AddBookIdToIllustrations < ActiveRecord::Migration
  def self.up
    #add_column    :illustrations, :book_id, :integer
    #add_index     :illustrations, :book_id
  end

  def self.down
    #remove_index  :illustrations, :book_id
  end
end
