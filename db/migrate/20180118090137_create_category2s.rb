class CreateCategory2s < ActiveRecord::Migration
  def change
    create_table :category2s do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
