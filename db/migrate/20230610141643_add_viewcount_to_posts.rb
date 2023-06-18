class AddViewcountToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :viewcount, :integer, default: 0
  end
end
