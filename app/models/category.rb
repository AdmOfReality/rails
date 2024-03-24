class Category < ApplicationRecord
  default_scope -> { order(title: :ASC) }

  has_many :tests

  validates :title, presence: true
end
