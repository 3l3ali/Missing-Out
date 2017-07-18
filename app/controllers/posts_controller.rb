class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index         # GET /posts
    @posts = Post.all
  end

  def show          # GET /posts/:id
  end

  def new           # GET /posts/new
    @post = Post.new
  end

  def create        # POST /posts
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit          # GET /posts/:id/edit
  end

  def update        # PATCH /posts/:id
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy       # DELETE /posts/:id
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, photos: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
