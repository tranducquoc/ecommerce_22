class Categorie < ApplicationRecord
  has_many :products

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  validate :image_size

  private

  def image_size
    if image.size > Settings.maximum_update_image.megabytes
      errors.add(:image, "picture_than_5MB")
    end
  end
end
