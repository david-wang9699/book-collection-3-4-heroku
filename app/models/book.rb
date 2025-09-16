class Book < ApplicationRecord
  # BC4 associations
  has_many :user_books, dependent: :destroy
  has_many :users, through: :user_books

  # Existing BC3 validations
  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true, numericality: true
  validates :published_date, presence: true
end
