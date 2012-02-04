class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :trip_id
      t.integer :photo_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
