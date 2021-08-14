class ProductsController < ApplicationController
  before_action :authorize_admin, only: [:new, :create, :update, :edit, :destroy] 

  def featured
    @product = Product.find(params[:id])
    @product.featured = True
    flash[:notice] = "Product is now featured"
    render :index
  end

  def unfeatured
    @product = Product.find(params[:id])
    @product.featured = false
    flash[:notice] = "Product is no longer featured"
    render :index
  end

  def index
    @products = Product.all
    @products_featured = Product.featured_products
    render :index
  end

  def most
    @product_most_reviews = Product.most_reviews
    render :most
  end

  def recent
    @products_recent = Product.recent_three
    render :recent
  end

  def us
    @products_us = Product.made_in_us
    render :us
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added"
      redirect_to products_path
    else
      flash[:error] = "Product was not added"
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated"
      redirect_to products_path
    else
      flash[:error] = "Product was not updated"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product deleted"
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin, :featured)
    end

end
