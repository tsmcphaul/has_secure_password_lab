class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to :welcome
        else
          redirect_to :new_user
        end
    end 

    def new
        @user = User.new

    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
