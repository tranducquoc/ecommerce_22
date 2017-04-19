class Suggest < ApplicationRecord
  belongs_to :user

  scope :suggest_create_today, -> {where("DATE(created_at) = ?", Date.today)}
end
