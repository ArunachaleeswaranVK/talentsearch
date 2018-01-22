class RemoveCategoryId2FromLiteratures < ActiveRecord::Migration
  def change
    remove_column :literatures, :category2_id
  end
end
