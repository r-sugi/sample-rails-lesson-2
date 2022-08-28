class ItemsController < ApplicationController
  def show
    # アイテムの表示
    @selling_image = SellingImage.find(params[:id])

    # 閲覧回数の保存
    latestViews = UserItemView.where(user_id: current_user.id, selling_image_id: @selling_image.id).order(created_at: :desc).limit(1)

    if latestViews.exists?
      UserItemView.create(user_id: current_user.id, selling_image_id: @selling_image.id) unless latestViews[0].created_at.day == Time.zone.now.day
    else
      UserItemView.create(user_id: current_user.id, selling_image_id: @selling_image.id)
    end
  end

  private
end
