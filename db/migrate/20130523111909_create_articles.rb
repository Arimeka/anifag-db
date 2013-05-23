class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :content, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :permalink, null: false
      t.string :source

      t.timestamps
    end
    add_index :articles, :created_at
  end
end
