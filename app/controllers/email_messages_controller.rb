class EmailMessagesController < ApplicationController
    before_action :authenticate_user!

    def new
        @email_message = EmailMessage.new 
    end

    def create
        email_params = params.require(:email_message).permit(:sender, :dest, :subject, :body)
        email_params[:sender] = "trial.shopify1@gmail.com"
        EmailMailer.send_email(email_params).deliver_now!
        redirect_to root_path, notice: 'Email succesfully sent'
    end
end
