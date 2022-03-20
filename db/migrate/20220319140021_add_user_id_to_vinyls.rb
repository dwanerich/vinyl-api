class AddUserIdToVinyls < ActiveRecord::Migration[6.1]
  def change
    add_column :vinyls, :user_id, :integer
    add_index :vinyls, :user_id
  end
end
