class AddLookingForToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :looking_for, :boolean
  end
end
