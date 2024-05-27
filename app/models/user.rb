class User < ApplicationRecord

  attr_reader :password
  attr_writer :password_confirmation

  has_many :my_tests, class_name: 'Test', foreign_key: :owner_id, inverse_of: :owner
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  scope :by_level, -> (level) { joins(:my_test).where(tests: {level: level}) }

  validates :email, presence: true
  validates :password, presence: true
  validates :password, confirmation: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def show_list_tests_by_level(level)
    my_tests.where(level: level).pluck(:title)
  end

  def self.list_by_level(level)
    by_level(level).pluck(:title)
  end

  def authenticate(password_string)
    digest(password_string) == self.password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA256.hexdigest(string)
  end

end

