class AddBelongsToFlowerToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :flower_id, :integer
  	add_index :comments, :flower_id
  end
end
