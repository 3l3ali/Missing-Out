class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = policy_scope(User).order(created_at: :desc)
    # @users = User.all
  end

  def show
    authorize @user
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to root_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
end
