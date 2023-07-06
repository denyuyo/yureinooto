class CreateJoinTablePostsTags < ActiveRecord::Migration[6.1]
  def change
    create_join_table :posts, :tags do |t|
    end
  end
end