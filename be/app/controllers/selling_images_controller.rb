class SellingImagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @selling_image = current_user.selling_images.build(selling_image_params)
    if @selling_image.save
      flash.now[:success] = "selling_image created!"
    else
      flash.now[:danger] = "invalid selling_image input"
    end
    redirect_to current_user
  end

  def destroy
  end

  private

    def selling_image_params
      params.require(:selling_image).permit(:content)
    end
end
