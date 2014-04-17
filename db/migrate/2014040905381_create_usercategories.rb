class CreateUsercategories < ActiveRecord::Migration
  def change
    create_table :usercategories do |t|
      t.integer :user_id
      t.string :category_id
      
      t.timestamps
    end
  end
end
