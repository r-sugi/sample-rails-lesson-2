class SearchController < ApplicationController
  def index
    key = params[:key].to_sym
    case key
    when :latest_uploaded then
      @images = SellingImage
        .where.not(picture: nil)
        .where("valid_from <= ? and valid_to > ?", Time.zone.now, Time.zone.now)
    else
      @images = []
    end
  end

  private


end
