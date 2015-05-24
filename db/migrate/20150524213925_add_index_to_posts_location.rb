class AddIndexToPostsLocation < ActiveRecord::Migration
  def change
    add_index :posts, :location  
  end
end
