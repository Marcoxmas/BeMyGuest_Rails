class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:index]
    def index
      @users = User.all
    end

    def toggle_user_type
      @user = User.find(params[:id])
      @user.update(user_type: (@user.user_type == 'regular_user') ? 'admin' : 'regular_user')
      redirect_to users_path, notice: 'User type toggled successfully.'
    end

    private
    def authorize_admin
      unless current_user.user_type == 'admin'
        redirect_to root_path, alert: "You are not authorized to access this page."
      end
    end
  end
  
  