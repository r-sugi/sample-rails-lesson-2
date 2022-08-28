class SellingImage < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validates :title, presence: true, length: { maximum: 100 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validate :valid_datetime

  default_scope -> { order(created_at: :desc) }

  mount_uploader :picture, PictureUploader
  validate  :picture_size

  def selling?
    valid_from <= Time.zone.now && valid_to > Time.zone.now
  end

  private

    def valid_datetime
      errors.add(:valid_from, 'must be a valid datetime') unless !!Date.parse(valid_from) rescue false
      errors.add(:valid_to, 'must be a valid datetime') unless !!Date.parse(valid_to) rescue false
    end

    # アップロード画像のサイズを検証する
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
