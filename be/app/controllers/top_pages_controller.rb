# frozen_string_literal: true
class TopPagesController < ApplicationController
  def index
    @latest_uploaded_selling_images = SellingImage
      .where.not(picture: nil)
      .where("valid_from <= ? and valid_to > ?", Time.zone.now, Time.zone.now)
      .limit(5)
  end
end
