class TweetsController < ApplicationController
    before_action :require_logged_in
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]

    def index
        @tweets = Current.user.tweets
    end
    
    def new
        @tweet = Tweet.new
    end
    
    def create
        @tweet = Current.user.tweets.create(tweet_params)
        if @tweet.save
          flash[:success] = "Tweet successfully scheduled"
          redirect_to tweets_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def edit
    end

    def update
        if @tweet.update(tweet_params)
          flash[:success] = "Tweet was successfully updated"
          redirect_to tweets_path
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    
    def destroy
        if @tweet.destroy
            flash[:success] = 'Tweet was unscheduled'
            redirect_to tweets_path
        else
            flash[:error] = 'Something went wrong'
            redirect_to tweets_path
        end
    end
    

    private
    
    def tweet_params
        params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
    end

    def set_tweet
        @tweet = Current.user.tweets.find(params[:id])
    end
end