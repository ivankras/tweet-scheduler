class TwitterAccountsController < ApplicationController
    before_action :require_logged_in
    before_action :set_twitter_account, only: [:destroy]
    
    def index
        @twitter_accounts = Current.user.twitter_accounts
    end
    
    def destroy        
        if @twitter_account.destroy
            flash[:success] = 'Twitter account was successfully deleted.'
            redirect_to twitter_accounts_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to twitter_accounts_url
        end
    end

    private
    def set_twitter_account
        @twitter_account = Current.user.twitter_accounts.find(params[:id])
    end
end