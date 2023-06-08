class TweetsController < ApplicationController

  before_action :set_tweet, only: %i[ show edit update destroy ] 
  before_action :authenticate_user!, except: [:index, :show]
  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    @tweet = current_user.tweets.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweet_url(@tweet), notice: "Tweet was successfully created."
    else
      render :new, status: :unprocessable_entity 
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    if @tweet.update(tweet_params)
      redirect_to tweet_url(@tweet), notice: "Tweet was successfully updated."
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: "Tweet was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:user_id, :content)
    end
end
