class TopicsController < ApplicationController 

	def index 
		@topics = Topic.all 
	end 

	def show 
		@all_posts = Post.all 
		@topic = Topic.find params[:id]
		@posts = []
		@all_posts.each do |post|
			if post.topic == @topic 
				@posts << post 
			end 
		end 
	end 
end 

