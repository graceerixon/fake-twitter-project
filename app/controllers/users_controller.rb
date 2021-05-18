class UsersController < ApplicationController
  def profile
    @userId = params[:user_id]
    @user = User.find(params[:user_id])
    @followerCount = @user.followers_count
    @followingCount = @user.follow_count
    @userCount = @user.tweets
    @tweets = Tweet.all
  end

  def follow
    ApplicationRecord.table_name= "users"
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to user_profile_path(@user)
  end

  def unfollow
    ApplicationRecord.table_name= "users"
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to user_profile_path(@user)
  end
end
