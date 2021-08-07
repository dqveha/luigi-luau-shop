class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
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
    flash[:notice] = "Review deleted"
    redirect_to product_path(@review.product)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review has been updated"
      redirect_to product_path(@review.product)
    else
      @product = Product.find(params[:product_id])
      flash[:error] = "There was a problem updating your review"
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
