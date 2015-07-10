class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic 

  def self.search(query)
  	where("title ILIKE ? OR description ILIKE ?", "%#{query}%", "%#{query}%")
  end

end
