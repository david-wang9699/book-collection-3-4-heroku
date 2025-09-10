require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with required attributes" do
    book = Book.new(
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      price: 9.99,
      published_date: Date.new(1937, 9, 21)
    )
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: nil)
    expect(book).not_to be_valid
  end


    it "is invalid without an author" do
    book = Book.new(title: "Test Book", author: nil)
    expect(book).not_to be_valid
  end

  it "is invalid without a price" do
    book = Book.new(title: "Test Book", price: nil)
    expect(book).not_to be_valid
  end

  it "is invalid without a published_date" do
    book = Book.new(title: "Test Book", published_date: nil)
    expect(book).not_to be_valid
  end
end
