class CreateBasketItems < ActiveRecord::Migration[8.1]
  def change
    create_table :basket_items do |t|
      t.references :basket, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
    add_index :basket_items, [ :basket_id, :event_id ], unique: true
  end
end
