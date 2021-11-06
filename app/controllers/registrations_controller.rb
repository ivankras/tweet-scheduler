class RegistrationsController < ActionController::Base
    def new
        @user = User.new
    end

    def create
        # @user = Object.new(params[:user]) # NOT SECURE
        @user = Object.new(user_params)
        if @user.save
          flash[:success] = "User successfully created"
          redirect_to root_path
        #   redirect_to @user
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
