class IndexController < ApplicationController

  def index
    @products = Product.all
    @products_featured = Product.featured_products
    @product_most_reviews = Product.most_reviews
    @products_recent = Product.recent_three
    @products_us = Product.made_in_us
    render :index
  end

end

