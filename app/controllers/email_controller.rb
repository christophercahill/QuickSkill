class EmailController < ApplicationController

	def send_contact_email 
		@post = Post.find(params[:post])  
	    user_id = @post.user_id
	    @recipient = User.find(user_id)
	    @sender = current_user
	    UserMailer.welcome_email(@sender, @recipient, @post).deliver_now 
	    redirect_to @post
	end
end 