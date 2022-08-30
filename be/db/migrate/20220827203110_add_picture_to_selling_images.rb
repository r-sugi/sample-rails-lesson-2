class AddPictureToSellingImages < ActiveRecord::Migration[6.0]
  def change
    add_column :selling_images, :picture, :string, after: :user_id
  end
end
