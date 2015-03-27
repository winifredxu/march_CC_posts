class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :price
      t.text :description
      t.string :location

      t.timestamps null: false
    end
  end
end
