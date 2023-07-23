class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:index]
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
      @houses = @user.houses
    end
    
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path, notice: "Your profile has been deleted."
    end

    def toggle_user_type
      @user = User.find(params[:id])
      @user.update(user_type: (@user.user_type == 'regular_user') ? 'admin' : 'regular_user')
      redirect_to users_path, notice: 'User type toggled successfully.'
    end

    def report_and_delete
      @user = User.find(params[:id])

      dest = @user.email
      @dest_name = @user.name

      #report email
      email_message = EmailMessage.new
      email_message.dest = dest
      email_message.subject = "BeMyGuest: Your Account has been Deleted"
      if EmailMailer.with(name: @dest_name).send_email_report(email_message).deliver_now! 
        @user.destroy
        redirect_to users_path, notice: 'User account has been Reported and Deleted from the system'
      else
        redirect_to users_path, notice: 'Account  Not Deleted from the system'
      end
      

      
    end

    private
    def authorize_admin
      unless current_user.user_type == 'admin'
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
  end
  
  