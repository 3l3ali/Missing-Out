class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index         # GET /posts
    @posts = policy_scope(Post).order(created_at: :desc)
    # @posts = Post.all
  end

  def show          # GET /posts/:id
    @review = Review.new
    authorize @post
  end

  def new           # GET /posts/new
    @post = Post.new
    @post.location = Location.new
    authorize @post
  end

  def create        # POST /posts
    @post = Post.new(post_params)
    @post.user = current_user
    @post.location = Location.create(location_params)
    authorize @post
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit          # GET /posts/:id/edit
    authorize @post
  end

  def update        # PATCH /posts/:id
    authorize @post
    @post.update(post_params)
    @post.location.update(location_params) if @post.location.present?
    redirect_to @post
  end

  def destroy       # DELETE /posts/:id
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :category, photos: [])
  end


  def location_params
    params.require(:post).require(:location).permit(:name, :address)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
