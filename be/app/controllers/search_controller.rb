class SearchController < ApplicationController
  def index
    key = params[:key].to_sym
    case key
    when :latest_uploaded then
      @title = '新着画像'
      @images = SellingImage
        .where.not(picture: nil)
        .order(created_at: :desc)
        .where("valid_from <= ? and valid_to > ?", Time.zone.now, Time.zone.now)
    when :most_attention then
      # TODO: 一発で取得する方法で実装したい
      @title = '注目されている画像'
      sql = <<-EOS
          SELECT
            selling_images.id
          from selling_images
          inner join
            (
              SELECT selling_image_id, COUNT(selling_image_id) FROM `user_item_views`
              group by `selling_image_id`
              order by COUNT(selling_image_id) desc
            )  AS cc
          on cc.selling_image_id = selling_images.id
          ;
        EOS

      ids = ActiveRecord::Base.connection.select_all(sql).to_hash.pluck("id")
      @images = SellingImage.where(id: ids).order("field(id, #{ids.join(',')})")
    else
      @title = ''
      @images = []
    end
  end

  private
end
