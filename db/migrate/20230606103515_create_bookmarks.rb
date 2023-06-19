class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end

    add_foreign_key :bookmarks, :users
    add_foreign_key :bookmarks, :posts
    add_index :bookmarks, :user_id
    add_index :bookmarks, :post_id
  end
end
