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

=begin        
        h_citta = house[:citta]
        h_nazione = house[:nazione]
        h_in = house[:data_in]
        h_out = house[:data_out]

        usr_name = current_user.name
        usr_mail = current_user.email

        usr_name_ds = usr_ds[:name]
        
        
        
        email_message.body = "<h2>Ciao #{usr_name_ds}!</h2><br> Hai una nuova richiesta di contatto per la tua casa 
                di #{h_citta}, #{h_nazione} a disposizione dal #{h_in} al #{h_out}<br>
                <h3>#{usr_name} sarebbe interessato a contattarti</h3><br>
                <a href='mailto:#{usr_mail}'>Clicca qui per scivere a #{usr_name}</a><br><br>

                <div><h2>Cordialmente<br>il Team di BeMyGuest Italy</h2><br> questa è una mail autogenerata, non rispondere a questo indirizzo</div>
           " 
=end
        #email_message.sender = "trial.shopify1@gmail.com"
        
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
        @email_messages = EmailMessage.all
    end

    def destroy
        @email_message = EmailMessage.find(params[:id])
        @email_message.destroy
        respond_to do |format|
            format.html { redirect_back(fallback_location: root_path, notice: "Messaggio assistenza chiuso con successo.") }
            format.json { head :no_content }
          end    
    end

    private
    def authorize_admin
      unless current_user.user_type == 'admin'
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
end
