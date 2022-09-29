class CreateUserItemViews < ActiveRecord::Migration[6.0]
  def change
    create_table :user_item_views do |t|
      t.integer :user_id
      t.integer :selling_image_id
      t.timestamps
    end
    add_index :user_item_views, [:user_id, :selling_image_id], unique: false
  end
end
