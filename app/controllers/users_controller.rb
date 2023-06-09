class UsersController < ApplicationController
  def show
    @user = User.find_by_username(params[:username])
    Rails.logger.debug("My object: #{params[:username]}")
    @tweets = @user.tweets
  end
end
