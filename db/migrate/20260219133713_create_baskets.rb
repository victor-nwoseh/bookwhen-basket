class CreateBaskets < ActiveRecord::Migration[8.1]
  def change
    create_table :baskets do |t|
      t.string :session_token

      t.timestamps
    end
    add_index :baskets, :session_token
  end
end
