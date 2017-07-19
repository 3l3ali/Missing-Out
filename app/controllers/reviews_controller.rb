class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]

  def index         # GET /reviews
    @reviews = Review.all
  end

  def show          # GET /reviews/:id
  end

  def new           # GET /reviews/new
    @review = Review.new
    authorize @review
  end

  def create        # review /reviews
    @review = Review.new(review_params)
    @review.user = current_user
    @post = Post.find(params[:post_id])
    @review.post = @post
    authorize @review
    if @review.save
      respond_to do |format|
        format.html { redirect_to post_path(@review.post) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'posts/show' }
        format.js  # <-- idem
      end
    end
  end

  def edit          # GET /reviews/:id/edit
    authorize @review
  end

  def update        # PATCH /reviews/:id
    authorize @review
    if @review.update(review_params)
      redirect_to post_path(@review.post)
    else
      render 'edit'
    end
  end

  def destroy       # DELETE /reviews/:id
    authorize @review
    @review.destroy
    # redirect_to post_path(@review.post)
    respond_to do |format|
      format.html { redirect_to post_path(@review.post) }
      format.js  # <-- idem
    end

  end

  private

  def review_params
    params.require(:review).permit(:description, :recommended)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
