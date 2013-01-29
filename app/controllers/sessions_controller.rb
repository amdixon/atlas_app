class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      @profile = current_user.profile
      @favorites = Favorite.all
      render 'profiles/show'
    else
          flash.now[:error] = 'Invalid email/password combination'
    end
  end

  def destroy
    sign_out
    redirect_to :back
  end
  
end
