class User < ApplicationRecord
  has_many :orders
  has_many :comment, dependent: :destroy
  has_many :rate, dependent: :destroy
  has_many :suggest, dependent: :destroy
  has_many :cart, dependent: :destroy
	
  before_save :downcase_email

  has_secure_password
  validates :name, presence: true, length: {maximum: Settings.maximum_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: {maximum: Settings.maximum_email},
    format: {with: VALID_EMAIL_REGEX}
  validates :address, presence: true, length: {maximum: Settings.maximum_address}
  validates :phone, presence: true, numericality: {only_integer: true},
    length: {in: Settings.minimum_phone..Settings.maximum_phone}
  validates :password, presence: true, length: {minimum: Settings.minimum_password}

  private
  def downcase_email
    self.email = email.downcase
  end
end
