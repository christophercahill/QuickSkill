class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :email
      t.string :name
      t.string :phone_number
      t.text :biography
      t.string :location

      t.timestamps null: false
    end
  end
end
