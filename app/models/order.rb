class Order < ApplicationRecord
  enum status: {created: 0, confirmed: 1,
    delivering: 2, received: 3, fail: 4, cancel: 5}

  belongs_to :user

  has_many :order_details

  validates :address, presence: true
  validates :phone, presence: true, numericality: {only_integer: true},
    length: {in: Settings.minimum_phone..Settings.maximum_phone}
  validates :note, length: {maximum: Settings.maximum_note}
  validates :delivery_day, presence: :true
  validates :status, presence: :true

  delegate :id, to: :user, prefix: true
  delegate :name, to: :user, prefix: true
  delegate :address, to: :user, prefix: true
  delegate :phone, to: :user, prefix: true
  delegate :email, to: :user, prefix: true
  delegate :created_at, to: :user, prefix: true

  scope :all_orders, -> {order created_at: :desc}
  scope :order_create_today, -> {where("DATE(created_at) = ?", Date.today)}
end
