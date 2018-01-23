class AddUserIdToLiteratures < ActiveRecord::Migration
  def change
    add_column :literatures, :user_id, :integer
  end
end
