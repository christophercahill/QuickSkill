class RemoveTopicFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :topic, :string
  end
end
