class CreateFlowers < ActiveRecord::Migration
  def change
    create_table :flowers do |t|
      t.string :url
      t.string :name
      t.text :description
      t.belongs_to :user

      t.timestamps
    end
  end
end
