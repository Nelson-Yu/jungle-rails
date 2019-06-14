class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = @product.review.create(review_params)
    @review.user = current_user
    @review.save
    redirect_to product_url(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_url(@product)
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

end
