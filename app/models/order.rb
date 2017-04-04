class Order < ApplicationRecord
  enum status: {created: 0, confirmed: 1,
    delivering: 2, received: 3, fail: 4, cancel:5}

  belongs_to :user

  has_many :order_details

  delegate :id, to: :user, prefix: true
  delegate :name, to: :user, prefix: true
  delegate :address, to: :user, prefix: true
  delegate :phone, to: :user, prefix: true
  delegate :email, to: :user, prefix: true
  delegate :created_at, to: :user, prefix: true

  scope :all_orders, -> {order created_at: :desc}
end
