class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.review.order(created_at: :desc)
    @count = @reviews.count
    @average = @reviews.average(:rating).to_f.round(1)
    @current_user = current_user
  end

end
