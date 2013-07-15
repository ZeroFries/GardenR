class AddActiveToFlower < ActiveRecord::Migration
  def change
    add_column :users, :active_flower, :integer
  end
end
