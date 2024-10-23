class UserBadge < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  validates :user_id, :badge_id, presence: true
end
