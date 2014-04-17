class CreateSellproducts < ActiveRecord::Migration
  def change
    create_table :sellproducts do |t|
      t.integer :stuff_id
      t.integer :user_id

      t.timestamps
    end
  end
end
