# frozen_string_literal: true
class TopPagesController < ApplicationController
  def index
    @latest_uploaded_selling_images = SellingImage
      .where.not(picture: nil)
      .where("valid_from <= ? and valid_to > ?", Time.zone.now, Time.zone.now)
      .order(created_at: :desc)
      .limit(5)

    # TODO: 一発で取得する方法で実装したい
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
      limit 5
      ;
    EOS

    ids = ActiveRecord::Base.connection.select_all(sql).to_hash.pluck("id")
    @most_viewed_selling_images = SellingImage.where(id: ids).order("field(id, #{ids.join(',')})")
  end

  private
end
