class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :new_guide]

  def index
    @users = policy_scope(User).order(created_at: :desc)
    # @users = User.all
  end

  def new_guide
    authorize @user, :new_guide?
    # @user.languages.build
  end


  def show
    authorize @user
  end

  def update
    authorize @user
    # current_user.languages << Language.new(language_params)
    redirect_to current_user if current_user.update(user_params)
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

    # def user_params
    #   params.require(:user).permit(:age, :gender, language_ids: [])
    # end

    def user_params
      params.require(:user).permit(:age, :gender, :travel_guide, :location, :contact, languages_attributes: [:id, :name, :_destroy])
    end


  # def language_params
  #   params.require(:user).require(:language).permit(:name)
  # end
end
