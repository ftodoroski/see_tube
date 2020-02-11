class UsersController < ApplicationController
    before_action :authorized, except: [:new, :create]
    
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            flash[:message] = 'You have successfully created an account'
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash.now[:message] = @user.errors.full_messages
            render :new
        end
    end

    def show 
        @user = current_user
    end

    private 
    def user_params 
        params.require(:user).permit(:name, :username, :password, :email)
    end

end


