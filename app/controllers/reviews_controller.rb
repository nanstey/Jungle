class ReviewsController < ApplicationController

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

  def product_id
    params.permit(:product_id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



end
