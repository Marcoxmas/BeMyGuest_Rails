class EmailMessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin, only: [:index, :destroy]

    def contact_host
        email_message = EmailMessage.new
        id = params[:user_id]
        usr_ds = User.select(:email, :name).find_by(id: id)

        id_house = params[:house]
        @house_i = House.find(id_house)
        @user_n = usr_ds[:name]

        email_message.dest = usr_ds[:email]
        email_message.subject = "BeMyGuest: New possible Exchange found!"
        if EmailMailer.with(user: current_user, dest: @user_n, house: @house_i).send_email(email_message).deliver_now!
            redirect_to root_path, notice: "L'Host è stato contattato con successo"        
        else 
            redirect_to root_path, notice: "Non è stato possibile contatare l'Host"        

        end
    end
    def new
        @email_message = EmailMessage.new
    end

    def create
        email_params = params.require(:email_message).permit(:subject, :body)
        @email_message = EmailMessage.new(email_params)
        @email_message.sender = current_user.email
        #EmailMailer.send_email(email_params).deliver_later
        if @email_message.save
            redirect_to user_path(current_user.id), notice: "Il messaggio è stato inviato al Servizio Clienti"
        else
            puts @email_message.errors.inspect
            redirect_to user_path(current_user.id), notice: "Errore nell'invio del messaggio"
        end
    end

    def index 
        @email_messages = EmailMessage.all.order(created_at: :desc)
    end

    def destroy
        @email_message = EmailMessage.find(params[:id])
        @email_message.destroy
        
        redirect_to email_messages_path, notice: "Messaggio assistenza chiuso con successo."
      
    end

    private
    def authorize_admin
      unless current_user.user_type == 'admin'
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
