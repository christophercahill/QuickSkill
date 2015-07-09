class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic 

  def self.search(query)
  	where("title LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%")
  end

end
