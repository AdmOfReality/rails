class Test < ApplicationRecord
  belongs_to :user

  def self.sort_desc_test_name_by_category(title)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: {title: title}).order(title: :desc).pluck(:title)
  end
end
