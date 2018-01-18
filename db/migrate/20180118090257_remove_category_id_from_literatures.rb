class RemoveCategoryIdFromLiteratures < ActiveRecord::Migration
  def change
     remove_column :literatures, :category_id
  end
end
