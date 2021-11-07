class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.present?
            # send email
            PasswordMailer.with(user: @user).reset.deliver_later
        end
        redirect_to root_path,\
            notice: "If an account exists with the provided email, we have sent a link to reset the password"
    end

    def edit
        @user = User.find_signed!(params[:token], purpose: "password_reset")        
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to signin_path, alert: "Your token has expired. Please try again"
    end

    def update
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to signin_path, notice: "Your password was reset successfully, please log in"
        else
            redirect :edit
        end
    end

    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end