class CreateUserBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :user_books do |t|
      t.integer :user_id, null: false
      t.integer :book_id, null: false
      t.timestamps
    end

    add_index :user_books, [:user_id, :book_id], unique: true
    add_foreign_key :user_books, :users, column: :user_id
    add_foreign_key :user_books, :books, column: :book_id
  end
end
