require 'rails_helper'



RSpec.feature "Book management", type: :feature do
  scenario "User fails to add a book without an author" do
    visit new_book_path
    fill_in "Title", with: "Test Book"
    fill_in "Author", with: ""
    fill_in "Price", with: "9.99"
    select "2023", from: "book_published_date_1i"
    select "January", from: "book_published_date_2i"
    select "1", from: "book_published_date_3i"
    click_button "Create Book"
    expect(page).to have_content("Author can't be blank")
  end

  scenario "User fails to add a book without a price" do
    visit new_book_path
    fill_in "Title", with: "Test Book"
    fill_in "Author", with: "J.R.R. Tolkien"
    fill_in "Price", with: ""
    select "2023", from: "book_published_date_1i"
    select "January", from: "book_published_date_2i"
    select "1", from: "book_published_date_3i"
    click_button "Create Book"
    expect(page).to have_content("Price can't be blank")
  end

  scenario "User fails to add a book without a published date" do
    visit new_book_path
    fill_in "Title", with: "Test Book"
    fill_in "Author", with: "J.R.R. Tolkien"
    fill_in "Price", with: "9.99"
    # Skip selecting published_date
    click_button "Create Book"
    expect(page).to have_content("Published date can't be blank")
  end
end
