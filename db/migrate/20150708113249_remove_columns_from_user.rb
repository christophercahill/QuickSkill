class RemoveColumnsFromUser < ActiveRecord::Migration
  def change 
  	remove_attachment :users, :avatar
  	remove_column :users, :phone_number 
  	remove_column :users, :location
  	remove_column :users, :biography
  end
end
