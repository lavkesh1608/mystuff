class CreateStuffs < ActiveRecord::Migration
  def change
    create_table :stuffs do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :brand
      t.string :name
      t.string :model
      t.string :description
      t.string :price
      t.date :date_of_purchase
      t.boolean :is_user_category

      t.timestamps
    end
  end
end
