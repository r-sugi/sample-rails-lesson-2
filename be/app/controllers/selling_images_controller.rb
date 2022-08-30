class SellingImagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    @selling_images = user.selling_images
      .order(updated_at: :desc).paginate(page: params[:page])

    @selling_image = user.selling_images.build
  end

  def create
    @selling_images = user.selling_images
      .order(updated_at: :desc).paginate(page: params[:page])
    @selling_image = user.selling_images.build

    @selling_image = user.selling_images.build(selling_image_params)
    if @selling_image.save
      flash.now[:success] = "新規画像を出品しました！"
      render "index"
    else
      flash.now[:danger] = "入力内容が正しくありません。"
      render "index"
    end
  end

  def destroy
    @selling_image.update!(valid_to: Time.zone.now)
    flash[:success] = "タイトル #{@selling_image.title} の画像を削除しました！"
    redirect_to request.referrer
  end

  private

    def user
      @user ||= User.find(params[:user_id])
    end

    def selling_image_params
      params.require(:selling_image).permit(:content, :picture, :title, :valid_to, :valid_from, :price)
    end

    def correct_user
      @selling_image = current_user.selling_images.find_by(id: params[:id])
      redirect_to root_url if @selling_image.nil?
    end
end
