class SellingImagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @selling_image = current_user.selling_images.build(selling_image_params)
    if @selling_image.save
      flash.now[:success] = "selling_image created!"
      redirect_to current_user
    else
      flash.now[:danger] = "invalid selling_image input"
      render 'users/show', user: current_user
    end
  end

  def destroy
    @selling_image.destroy!
    flash[:success] = "SellingImage deleted"
    redirect_to request.referrer
  end


  private

    def selling_image_params
      params.require(:selling_image).permit(:content, :picture, :title, :valid_to, :valid_from, :price)
    end

    def correct_user
      @selling_image = current_user.selling_images.find_by(id: params[:id])
      redirect_to root_url if @selling_image.nil?
    end
end
