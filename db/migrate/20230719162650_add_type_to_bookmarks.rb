class AddTypeToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :type, :string
  end
end
