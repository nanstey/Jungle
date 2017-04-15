class ReviewsController < ApplicationController

  before_filter

  def create
    review = Review.new(review_params)
    review.user_id = session[:user_id]
    review.product_id = params[:product_id]
    review.save
    redirect_to product_path(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def destroy
    review = Review.find(review_id)
    product_id = review.product_id
    if review.user_id == session[:user_id]
      review.destroy
    end
    redirect_to product_path(product_id)
  end

  def review_id
    params.require(:id)
  end



end
