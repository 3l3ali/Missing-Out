class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :new_guide]

  def index
    @users = policy_scope(User).order(created_at: :desc)
    # @users = User.all
  end

  def new_guide
    authorize @user, :new_guide?
  end


  def show
    authorize @user
  end

  def update
    authorize @user
    # current_user.languages << Language.new(language_params)
    if current_user.update(user_params)
      redirect_to current_user
    else
      render :new_guide
    end
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

    def user_params
      params.require(:user).permit(:age, :gender, :travel_guide, :location, :contact, languages_attributes: [:id, :name, :_destroy])
    end
end
