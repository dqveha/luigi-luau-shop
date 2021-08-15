class ReviewsController < ApplicationController
  before_action :authorize, only: [:new]
  before_action :authorize_admin, only: [:edit, :update, :destroy] 

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def newest
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews.newest(@product.id)
    render action: :newest
  end

  def oldest
    @product = Product.find(params[:product_id])
    @reviews = @product.reviews.oldest(@product.id)
    render action: :oldest #same as newest... need to find a way to DRY this up
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review deleted."
    redirect_to product_path(@review.product)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review has been updated."
      redirect_to product_path(@review.product)
    else
      @product = Product.find(params[:product_id])
      flash[:error] = "There was a problem updating the review."
      render :edit
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review created"
      redirect_to product_path(@product)
    else
      flash[:error] = "There was a problem uploading your review."
      render :new
    end
  end

  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end
end
