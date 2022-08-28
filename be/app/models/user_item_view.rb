class UserItemView < ApplicationRecord
  belongs_to :user
  belongs_to :selling_image
end
