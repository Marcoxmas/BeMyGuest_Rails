class EmailMailer < ApplicationMailer

    def send_email(email_params)
        sender = email_params[:sender]
        dest = email_params[:dest]
        subject = email_params[:subject]
        body = email_params[:body]

        mail(to: dest, from: sender, subject: subject, body: body)
    end
end
