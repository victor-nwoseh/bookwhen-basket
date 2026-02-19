class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.integer :capacity
      t.integer :price_pence
      t.string :category
      t.string :instructor
      t.integer :spots_remaining

      t.timestamps
    end
  end
end
