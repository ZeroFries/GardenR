class ChangeFlowerUrlToText < ActiveRecord::Migration
  def change
  	change_column :flowers, :url, :text
  end
end