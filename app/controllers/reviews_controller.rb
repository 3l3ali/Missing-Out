class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def index         # GET /reviews
    @reviews = Review.all
  end

  def show          # GET /reviews/:id
  end

  def new           # GET /reviews/new
    @review = Review.new
  end

  def create        # review /reviews
    @review = Review.new(review_params)
    @review.user = current_user
    @post = Post.find(params[:post_id])
    @review.post = @post
    if @review.save
      redirect_to post_path(@review.post)
    else
      render 'posts/show'
    end
  end

  def edit          # GET /reviews/:id/edit
  end

  def update        # PATCH /reviews/:id
    if @review.update(review_params)
      redirect_to post_path(@review.post)
    else
      render 'edit'
    end
  end

  def destroy       # DELETE /reviews/:id
    @review.destroy
    redirect_to post_path(@review.post)
  end

  private

  def review_params
    params.require(:review).permit(:description, :recommended)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
