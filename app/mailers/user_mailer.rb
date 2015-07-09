class UserMailer < ApplicationMailer
	default from: 'quickskillsapp@gmail.com'

	def welcome_email(sender, recipient, post)
		@recipient = recipient  
		@sender = sender 
		@post = post 
		mail(to: @recipient.email, subject: 'Good News from QuickSkill!')
	end
end
