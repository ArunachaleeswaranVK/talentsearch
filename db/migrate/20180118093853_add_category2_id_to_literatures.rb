class AddCategory2IdToLiteratures < ActiveRecord::Migration
  def change
    add_column :literatures, :category2_id, :integer
  end
end
