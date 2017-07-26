class FavouritesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @count = current_user.favourite_posts.count
    @activities = current_user.favourite_posts.where(category: "activities").order(created_at: :desc)
    @foods = current_user.favourite_posts.where(category: "foods").order(created_at: :desc)
    @entertainment = current_user.favourite_posts.where(category: "entertainment").order(created_at: :desc)
  end

  def add
    @post = Post.find(params[:post_id])
    authorize @post, :add?
    current_user.favourite_posts << @post
    redirect_back(fallback_location: root_path)
  end

  def remove
    @post = Post.find(params[:post_id])
    authorize @post, :remove?
    current_user.favourite_posts.delete(@post)
    redirect_back(fallback_location: root_path)
  end
end
