class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def most
    @products = Product.all
    @product_most_reviews = @products.most_reviews
    render :most
  end

  def recent
    @products = Product.all
    @products_recent = @products.recent_three
    render :recent
  end

  def us
    @products = Product.all
    @products_us = @products.made_in_us
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
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end

end
