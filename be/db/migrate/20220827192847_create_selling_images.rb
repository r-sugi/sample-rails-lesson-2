class CreateSellingImages < ActiveRecord::Migration[6.0]
  def change
    create_table :selling_images do |t|
      t.text :title, null: false
      t.integer :price
      t.datetime :valid_from
      t.datetime :valid_to
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :selling_images, [:user_id, :created_at]
  end
end
