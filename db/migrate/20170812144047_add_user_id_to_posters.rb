class AddUserIdToPosters < ActiveRecord::Migration
  def change
    add_column :posters, :user_id, :integer
    add_index :posters, :user_id
  end
end
