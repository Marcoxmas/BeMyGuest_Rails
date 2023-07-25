class EmailMailer < ApplicationMailer

    default from: "BeMyGuest <trial.shopify1@gmail.com>"

=begin def send_email(email_params)
        sender = email_params[:sender]
        dest = email_params[:dest]
        subject = email_params[:subject]
        body = email_params[:body]

        mail(to: dest, from: sender, subject: subject, body: body)
    end 
=end

    def send_email(email_message)

        @user = params[:user]
        @name_dest = params[:dest]
        @hou = params[:house]

        #sender = email_message.sender
        dest = email_message.dest
        subject = email_message.subject
        #body = email_message.body
        attachments.inline['logo3.png'] = File.read('app/assets/images/loghi/logo3.png')
        mail(to: dest, subject: subject, reply_to: 'BeMyGuest')
    end

    def send_email_report(email_message)

        @name = params[:name]
        #sender = email_message.sender
        dest = email_message.dest
        subject = email_message.subject
        #body = email_message.body
        attachments.inline['logo3.png'] = File.read('app/assets/images/loghi/logo3.png')
        mail(to: dest, subject: subject, reply_to: 'BeMyGuest')
    end

    def send_email_del_house(email_message)
        @name = params[:name]
        @hou = params[:hou]
        dest = email_message.dest
        subject = email_message.subject
        attachments.inline['logo3.png'] = File.read('app/assets/images/loghi/logo3.png')
        mail(to: dest, subject: subject, reply_to: 'BeMyGuest')

    end
end
