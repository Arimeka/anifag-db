class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :title

      t.timestamps
    end
    add_index :categories, :created_at
    add_index :categories, :title
  end
end
