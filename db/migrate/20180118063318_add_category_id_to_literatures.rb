class AddCategoryIdToLiteratures < ActiveRecord::Migration
  def change
    add_column :literatures, :category_id, :integer
  end
end
