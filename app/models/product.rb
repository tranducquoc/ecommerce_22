class Product < ApplicationRecord
  belongs_to :categorie

  has_many :order_details
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :carts, dependent: :destroy

  mount_uploader :picture, PictureUploader

  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  validates :info, presence: true
  validates :price, presence: true, length: {maximum: Settings.maximum_price,
    minimum: Settings.minimum_price}
  validates :categorie_id, presence:true
  validate  :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, t("picture_than_5MB"))
    end
  end
end
