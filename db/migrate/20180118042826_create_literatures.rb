class CreateLiteratures < ActiveRecord::Migration
  def change
    create_table :literatures do |t|
      t.string :title
      t.text :body
      
      t.timestamps null: false
    end
  end
end
