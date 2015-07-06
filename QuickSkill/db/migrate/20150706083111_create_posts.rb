class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :topic
      t.string :location
      t.string :price
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
