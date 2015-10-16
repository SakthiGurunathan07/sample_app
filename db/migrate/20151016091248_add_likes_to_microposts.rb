class AddLikesToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :likes, :integer
    
  end
end
