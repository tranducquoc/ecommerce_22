class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :product

  delegate :id, to: :product, prefix: true
  delegate :name, to: :product, prefix: true
  delegate :price, to: :product, prefix: true
  delegate :image, to: :product, prefix: true

  validates :quantity, presence: true,
    length: {maximum: Settings.maximum_quantity, minimum: Settings.minimum_quantily}

    def update_quantity
      self.update_attributes(quantity: quantity+1)
    end
end
