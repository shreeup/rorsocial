require 'rails_helper'
require 'spec_helper'
require 'byebug'

RSpec.describe "Tweets", type: :request do

  


  describe "GET /tweets" do
    it "works!" do
      get '/tweets#index'
      expect(response).to have_http_status(200)
    end
  end
  describe "post tweet_path with invalid data" do
    it "does not save a new entry or redirect" do
      
      tweet_attributes = FactoryBot.attributes_for(:tweet)
      user = FactoryBot.create(:user)
      sign_in user
      #tweet = build(:user, tweet_attributes)
      tweet_attributes.merge(user: user)
      tweet_attributes[:content]=nil
      expect {
        post tweets_path,params: {tweet: tweet_attributes}
      }.to_not change(Tweet, :count)
      expect(response).to render_template(:new)
    end
  end

  describe "post tweet_path with valid data" do
    it "does not save a new entry or redirect" do
      
      tweet_attributes = FactoryBot.attributes_for(:tweet)
      user = FactoryBot.create(:user)
      sign_in user
      #tweet = build(:user, tweet_attributes)
      tweet_attributes.merge(user: user)
      expect {
        post tweets_path,params: {tweet: tweet_attributes}
      }.to change(Tweet, :count)
    
      expect(response).to redirect_to tweet_url(id: Tweet.last.id)
    end
  end


end
