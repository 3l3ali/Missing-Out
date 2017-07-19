class FollowingsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    authorize @user, :follow?
    @user.followers << current_user
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    authorize @user, :unfollow?
    @user.followers.delete(current_user)
    redirect_to @user
  end
end
