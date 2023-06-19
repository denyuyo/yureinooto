class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end

    add_foreign_key :comments, :users
    add_foreign_key :comments, :posts
    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end
