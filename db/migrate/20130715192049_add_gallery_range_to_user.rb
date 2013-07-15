class AddGalleryRangeToUser < ActiveRecord::Migration
  def change
    add_column :users, :gallery_range, :integer
  end
end
