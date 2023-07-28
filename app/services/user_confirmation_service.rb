class UserConfirmationService
    def self.call(resource)
        email_message = EmailMessage.new
        user = resource
        email_message.dest = user.email
        email_message.subject = "BeMyGuest: Your Account is Confirmed!"
        if user.confirmed_at
            EmailMailer.with(name: user.name).send_conf_sign_up(email_message).deliver_now!
        end
    end
    
end