class Product < ApplicationRecord
  belongs_to :categorie
  
  has_many :order_details
  has_many :comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :carts, dependent: :destroy
end
