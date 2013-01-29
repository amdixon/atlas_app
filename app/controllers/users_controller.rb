class UsersController < ApplicationController
    def index
      @users = User.all
    end
  
    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
      render :layout => false
    end
    
    def create
      @user = User.create!(params[:user])
      sign_in @user
      @profile = @user.profile
      respond_to do |format|
        format.html {redirect_to profile_path(@user.profile)}
        format.js
      end
    end
end
