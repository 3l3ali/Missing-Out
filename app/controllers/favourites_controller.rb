class FavouritesController < ApplicationController
  def add
    @post = Post.find(params[:post_id])
    authorize @post, :add?
    current_user.favourite_posts << @post
    redirect_to @post
  end

  def remove
    @post = Post.find(params[:post_id])
    authorize @post, :remove?
    current_user.favourite_posts.delete(@post)
    redirect_to @post
  end
end
