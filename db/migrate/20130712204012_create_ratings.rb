class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.boolean :up_vote
      t.references :user, index: true
      t.references :flower, index: true

      t.timestamps
    end
  end
end
