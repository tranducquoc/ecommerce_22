class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  delegate :name, to: :product, prefix: true
  delegate :id, to: :product, prefix: true
  delegate :image, to: :product, prefix: true
  delegate :status, to: :order, prefix: true

  validates :quantity, presence: true,
    length: {maximum: Settings.maximum_quantity, minimum: Settings.minimum_quantily}
  validates :note, length: {maximum: Settings.maximum_note}
  validates :order_id, presence: true
  validates :product_id, presence: true
end
