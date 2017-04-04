class NotificationEmail < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :count_email_regiter , -> {where(is_sended:  false)}
end
