# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

	 def contact_form("timothystahl@gmail.com", "timStahl", "hello")
  	@message = message
    	mail(from: email,
         to: 'your-email@example.com',
         subject: "A new contact form message from #{name}")
  	end
	
		end
end