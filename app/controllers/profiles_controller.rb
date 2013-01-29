class ProfilesController < ApplicationController
    def index
      @user = current_user
      @profiles = Profile.all
    end
  
    def show
      @user = current_user
    end

    def new
      @user = current_user
      @profile = Profile.new
    end
    
    def create
      @user = current_user
      @profile = Profile.new(params[:profile])
      if @profile.save
        flash[:success] = "Profile created successfully!"
        redirect_to @profile
      else
        render 'new'
      end
    end
    
    def edit
      @user = current_user
      @profile = Profile.find(params[:id])
    end
    
    def update
      @user = current_user
      @profile = Profile.find(params[:id])
      @favorites = Favorite.where("profile_id = ?", @profile.user_id).limit(10)
      respond_to do |format|
       @profile.update_attributes(params[:profile])
          
          format.html {redirect_to @profile}
          format.js
         
         end

    end
    
    def destroy
        Profile.find(params[:id]).destroy
        flash[:success] = "Profile deleted."
        redirect_to :root
    end
end
